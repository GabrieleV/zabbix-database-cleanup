-- intervals in days
SET @history_interval = 30;
SET @trends_interval = 90;

SELECT CONCAT('History interval is ', @history_interval, ' days') AS ' ';
SELECT CONCAT('Trends  interval is ', @trends_interval, ' days') AS ' ';

SELECT CONCAT(NOW(), ' - Cleanup trends older than ', @trends_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='trends';
DELETE FROM trends WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@trends_interval * 24 * 60 * 60);
OPTIMIZE TABLE trends ;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='trends' ;

SELECT CONCAT(NOW(), ' - Cleanup trends_uint older than ', @trends_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='trends_uint' ;
DELETE FROM trends_uint WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@trends_interval * 24 * 60 * 60);
OPTIMIZE TABLE trends_uint ;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='trends_uint' ;

SELECT CONCAT(NOW(), ' - Cleanup Alerts older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema='zabbix' and table_name='alerts' ;
DELETE FROM alerts WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE alerts;
SELECT (data_length+index_length)/power(1024,2) TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema='zabbix' and table_name='alerts'; 

SELECT CONCAT(NOW(), ' - Cleanup acknowledges older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='acknowledges' ;
DELETE FROM acknowledges WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE acknowledges;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='acknowledges' ;

SELECT CONCAT(NOW(), ' - Cleanup events older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='events' ;
DELETE FROM events WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE events;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='events' ;

SELECT CONCAT(NOW(), ' - Cleanup history_str older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_interval' ;
DELETE FROM history_str WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE history_interval;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_interval' ;

SELECT CONCAT(NOW(), ' - Cleanup history_log older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_log' ;
DELETE FROM history_log WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE history_log ;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_log' ;

SELECT CONCAT(NOW(), ' - Cleanup history_text older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_text' ;
DELETE FROM history_text WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE history_text ;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_text' ;

SELECT CONCAT(NOW(), ' - Cleanup history older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history' ;
DELETE FROM history WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE history;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history' ;

SELECT CONCAT(NOW(), ' - Cleanup history_uint older than ', @history_interval, ' days') AS ' ';
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_BEFORE FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_uint' ;
DELETE FROM history_uint WHERE (UNIX_TIMESTAMP(NOW()) - clock) > (@history_interval * 24 * 60 * 60);
OPTIMIZE TABLE history_uint;
SELECT (data_length+index_length)/power(1024,2) AS TABLE_SIZE_MB_AFTER FROM information_schema.tables WHERE table_schema=DATABASE() and table_name='history_uint' ;


