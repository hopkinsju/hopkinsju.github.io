---
layout: post
title: "Deleting org units"
categories: code
tags: evergreen sql
ticketnos: 
excerpt: "blowing away org units can be tricky if you've done anything with them..."
---

{% highlight sql %}
-- How to completely remove an org unit. This will cause havoc if done unintentionally.

ALTER TABLE asset.call_number disable RULE protect_cn_delete;

BEGIN;

DELETE FROM asset.call_number WHERE owning_lib = 154;
DELETE FROM action_trigger.environment WHERE event_def in(select id FROM action_trigger.event_definition WHERE owner=154);
DELETE FROM action_trigger.event WHERE event_def in(select id FROM action_trigger.event_definition WHERE owner=154);
DELETE FROM action_trigger.event_definition WHERE owner=154;
DELETE FROM actor.org_unit_setting WHERE org_unit = 154;
DELETE FROM config.org_unit_setting_type_log WHERE org = 154;
DELETE FROM actor.org_unit WHERE id = 154;

COMMIT;

ALTER TABLE asset.call_number enable RULE protect_cn_delete;
{% endhighlight %}
