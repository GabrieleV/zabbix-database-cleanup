SELECT '-- Count the amount of rows that would be deleted for all orphaned acknowledge entries' AS ' ';
SELECT COUNT(*) AS ' ' FROM acknowledges WHERE NOT userid IN (SELECT userid FROM users);
SELECT COUNT(*) AS ' ' FROM acknowledges WHERE NOT eventid IN (SELECT eventid FROM events);

SELECT '-- Count the amount of rows that would be deleted for orphaned alerts entries' AS ' ';
SELECT COUNT(*) AS ' ' FROM alerts WHERE NOT actionid IN (SELECT actionid FROM actions);
SELECT COUNT(*) AS ' ' FROM alerts WHERE NOT eventid IN (SELECT eventid FROM events);
SELECT COUNT(*) AS ' ' FROM alerts WHERE NOT userid IN (SELECT userid FROM users);
SELECT COUNT(*) AS ' ' FROM alerts WHERE NOT mediatypeid IN (SELECT mediatypeid FROM media_type);

SELECT '-- Count the amount of rows that would be deleted for orphaned application entries that no longer map back to a host' AS ' ';
SELECT COUNT(*) AS ' ' FROM applications WHERE NOT hostid IN (SELECT hostid FROM hosts);

SELECT '-- Count the amount of rows that would be deleted for orphaned auditlog details (such as logins)' AS ' ';
SELECT COUNT(*) AS ' ' FROM auditlog_details WHERE NOT auditid IN (SELECT auditid FROM auditlog);
SELECT COUNT(*) AS ' ' FROM auditlog WHERE NOT userid IN (SELECT userid FROM users);

SELECT '-- Count the amount of rows that would be deleted for orphaned conditions' AS ' ';
SELECT COUNT(*) AS ' ' FROM conditions WHERE NOT actionid IN (SELECT actionid FROM actions);

SELECT '-- Count the amount of rows that would be deleted for orphaned functions' AS ' ';
SELECT COUNT(*) AS ' ' FROM functions WHERE NOT itemid IN (SELECT itemid FROM items);
SELECT COUNT(*) AS ' ' FROM functions WHERE NOT triggerid IN (SELECT triggerid FROM triggers);

SELECT '-- Count the amount of rows that would be deleted for orphaned graph items' AS ' ';
SELECT COUNT(*) AS ' ' FROM graphs_items WHERE NOT graphid IN (SELECT graphid FROM graphs);
SELECT COUNT(*) AS ' ' FROM graphs_items WHERE NOT itemid IN (SELECT itemid FROM items);

-- Count the amount of rows that would be deleted for orphaned host_profiles
-- SELECT COUNT(*) AS ' ' FROM hosts_profiles WHERE NOT hostid IN (SELECT hostid FROM hosts);
-- SELECT COUNT(*) AS ' ' FROM hosts_profiles_ext WHERE NOT hostid IN (SELECT hostid FROM hosts);

SELECT '-- Count the amount of rows that would be deleted for orphaned host macro' AS ' ';
SELECT COUNT(*) AS ' ' FROM hostmacro WHERE NOT hostid IN (SELECT hostid FROM hosts);

SELECT '-- Count the amount of rows that would be deleted for orphaned item data' AS ' ';
SELECT COUNT(*) AS ' ' FROM items WHERE hostid NOT IN (SELECT hostid FROM hosts);
SELECT COUNT(*) AS ' ' FROM items_applications WHERE applicationid NOT IN (SELECT applicationid FROM applications);
SELECT COUNT(*) AS ' ' FROM items_applications WHERE itemid NOT IN (SELECT itemid FROM items);

SELECT '-- Count the amount of rows that would be deleted for orphaned HTTP check data' AS ' ';
SELECT COUNT(*) AS ' ' FROM httpstep WHERE NOT httptestid IN (SELECT httptestid FROM httptest);
SELECT COUNT(*) AS ' ' FROM httpstepitem WHERE NOT httpstepid IN (SELECT httpstepid FROM httpstep);
SELECT COUNT(*) AS ' ' FROM httpstepitem WHERE NOT itemid IN (SELECT itemid FROM items);
SELECT COUNT(*) AS ' ' FROM httptest WHERE applicationid NOT IN (SELECT applicationid FROM applications);

SELECT '-- Count the amount of rows that would be deleted for orphaned maintenance data' AS ' ';
SELECT COUNT(*) AS ' ' FROM maintenances_groups WHERE maintenanceid NOT IN (SELECT maintenanceid FROM maintenances);

SELECT '-- SELECT COUNT(*) AS ' ' FROM maintenances_groups WHERE groupid NOT IN (SELECT groupid FROM groups);' AS ' ';
SELECT COUNT(*) AS ' ' FROM maintenances_hosts WHERE maintenanceid NOT IN (SELECT maintenanceid FROM maintenances);
SELECT COUNT(*) AS ' ' FROM maintenances_hosts WHERE hostid NOT IN (SELECT hostid FROM hosts);
SELECT COUNT(*) AS ' ' FROM maintenances_windows WHERE maintenanceid NOT IN (SELECT maintenanceid FROM maintenances);
SELECT COUNT(*) AS ' ' FROM maintenances_windows WHERE timeperiodid NOT IN (SELECT timeperiodid FROM timeperiods);

SELECT '-- Count the amount of rows that would be deleted for orphaned mappings' AS '';
SELECT COUNT(*) AS ' ' FROM mappings WHERE NOT valuemapid IN (SELECT valuemapid FROM valuemaps);

SELECT '-- Count the amount of rows that would be deleted for orphaned media / user items' AS ' ';
SELECT COUNT(*) AS ' ' FROM media WHERE NOT userid IN (SELECT userid FROM users);
SELECT COUNT(*) AS ' ' FROM media WHERE NOT mediatypeid IN (SELECT mediatypeid FROM media_type);
SELECT COUNT(*) AS ' ' FROM rights WHERE NOT groupid IN (SELECT usrgrpid FROM usrgrp);

SELECT '-- SELECT COUNT(*) AS ' ' FROM rights WHERE NOT id IN (SELECT groupid FROM groups);' AS ' ';
SELECT COUNT(*) AS ' ' FROM sessions WHERE NOT userid IN (SELECT userid FROM users);
-- SELECT COUNT(*) AS ' ' FROM user_history WHERE NOT userid IN (SELECT userid FROM users);

SELECT '-- Count the amount of rows that would be deleted for orphaned screens' AS ' ';
SELECT COUNT(*) AS ' ' FROM screens_items WHERE screenid NOT IN (SELECT screenid FROM screens);

SELECT '-- Count the amount of rows that would be deleted for orphaned events & triggers' AS ' ';
SELECT COUNT(*) AS ' ' FROM trigger_depends WHERE triggerid_down NOT IN (SELECT triggerid FROM triggers);
SELECT COUNT(*) AS ' ' FROM trigger_depends WHERE triggerid_up NOT IN (SELECT triggerid FROM triggers);

SELECT '-- Count the amount of records in the history/trends table for items that no longer exist' AS ' ';
SELECT COUNT(itemid) FROM history WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT COUNT(itemid) FROM history_uint WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT COUNT(itemid) FROM history_log WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT COUNT(itemid) FROM history_str WHERE itemid NOT IN (SELECT itemid FROM items);
-- SELECT COUNT(itemid) FROM history_sync WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT COUNT(itemid) FROM history_text WHERE itemid NOT IN (SELECT itemid FROM items);

SELECT COUNT(itemid) FROM trends WHERE itemid NOT IN (SELECT itemid FROM items);
SELECT COUNT(itemid) FROM trends_uint WHERE itemid NOT IN (SELECT itemid FROM items);
