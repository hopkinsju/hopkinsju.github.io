CREATE TABLE m_scenic.email_notify (
  hold INT,
  email TEXT,
  notify_time TIMESTAMP WITH TIME ZONE,
  method TEXT,
  done BOOLEAN DEFAULT FALSE
);

INSERT INTO m_scenic.email_notify (hold, email, method) (
  SELECT ahr.id, au.email, 'SendEmail'
  FROM action.hold_request ahr, actor.usr au
      WHERE ahr.email_notify = TRUE
        AND ahr.shelf_time IS NOT NULL
        AND ahr.capture_time < (now() - '12 hours'::interval)
        AND ahr.cancel_time IS NULL
        AND ahr.fulfillment_time IS NULL
        AND length(btrim(au.email)) > 6
        AND au.id = ahr.usr
  );

COPY (SELECT DISTINCT lower(regexp_replace(email, '\s*', '', 'g')) FROM m_scenic.email_notify WHERE done = FALSE) TO '/mnt/evergreen/tmp/hold_notification_emails.txt'
-- Now run off and send those emails

-- Make a bash script or something to do it...

      -- #!/bin/bash

      -- # Send some notification emails based on a list of emails exported from
      -- # the database. You'll need an email template with FROM: and SUBJECT: headers
      -- # and a list of email addresses in a file.

      -- while read email; do
      --   sendmail -t $email < hold_notify_email.tpl
      -- done < email_addresses.txt

-- Now update the production table

INSERT INTO action.hold_notification (hold, notify_time, method, note) 
  (SELECT hold, now(), method, 'sent manually' FROM m_scenic.email_notify
    WHERE done = FALSE
    AND hold NOT IN (
      SELECT id FROM action.hold_notification where method='SendEmail')
  );

UPDATE m_scenic.email_notify SET
  done = TRUE
  WHERE hold IN (
    SELECT hold FROM action.hold_notification 
      WHERE method = 'SendEmail' AND note = 'sent manually');
