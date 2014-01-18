---
layout: post
title: "Editing Copy Notes From A Mapping Document"
categories: code
tags: evergreen sql
ticketnos: ['42722']
excerpt: "Fixed some copy notes for Carthage today."
---

{% highlight sql %}
CREATE TABLE m_cgpl.copy_note_fix (
  old_title TEXT,
  old_content TEXT,
  new_title TEXT,
  new_content TEXT
  );

COPY m_cgpl.copy_note_fix FROM '/mnt/evergreen/tmp/cgpl_copy_note.map';

DELETE FROM m_cgpl.copy_note_fix WHERE old_title = 'old_title';

CREATE TABLE m_cgpl.copy_note_fix_undo AS (
  SELECT * FROM asset.copy_note where owning_copy IN (
    SELECT id from asset.copy where circ_lib = 150)
  );

UPDATE asset.copy_note acn
  SET title = btrim(mcnf.new_title),
      value = btrim(mcnf.new_content)
  FROM m_cgpl.copy_note_fix mcnf
  WHERE btrim(acn.title) = btrim(mcnf.old_title)
    AND btrim(acn.value) = btrim(mcnf.old_content)
    AND acn.owning_copy IN (
      SELECT id from asset.copy where circ_lib = 150);

DELETE FROM asset.copy_note
  WHERE (((title = '' OR title IS NULL)
        AND (value = '' OR value IS NULL))
      OR ((title = 'Migrated Category/Donor') AND (value = '' OR value IS NULL)))
    AND owning_copy IN (SELECT  id from asset.copy where circ_lib = 150);

SELECT setval('asset.copy_note_id_seq', (SELECT max(id) FROM asset.copy_note));


-- If you need to rollback...

-- UPDATE asset.copy_note a SET 
--   title = b.title, 
--   value = b.value 
--   FROM m_cgpl.copy_note_fix_undo b 
--   WHERE a.id = b.id;

-- INSERT INTO asset.copy_note (
--   SELECT * FROM m_cgpl.copy_note_fix_undo 
--   WHERE id NOT IN (
--     SELECT id FROM asset.copy_note));

{% endhighlight %}