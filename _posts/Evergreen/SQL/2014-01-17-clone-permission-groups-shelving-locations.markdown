---
layout: post
title: "Clone Permission Groups & Shelving Locations"
categories: code
tags: evergreen sql
ticketnos: ['12345', '54321']
excerpt: "a couple queries to speed up creation of new permission groups and copy locations during implementation"
---

{% highlight sql %}
INSERT INTO permission.grp_perm_map (grp,perm,depth) 
    SELECT ID_FOR_TARGET_GROUP, perm, depth FROM permission.grp_perm_map 
        WHERE grp = ID_FOR_SOURCE_GROUP AND perm NOT ( 
        	SELECT perm FROM permission.grp_perm_map WHERE grp = ID_FOR_TARGET_GROUP );


-- Clone Shelving Locations (The last where clause will prevent errors in the case that some 
-- locations have already been copied)

INSERT INTO asset.copy_location (name, owning_lib, holdable, opac_visible, circulate) 
    SELECT name, ID_OF_TARGET_LIB, holdable, opac_visible, circulate FROM asset.copy_location
        WHERE owning_lib = ID_FOR_SOURCE_LIB AND id NOT IN ( 
        	SELECT id FROM asset.copy_location WHERE owning_lib = ID_FOR_TARGET_LIB);
        	
{% endhighlight %}
