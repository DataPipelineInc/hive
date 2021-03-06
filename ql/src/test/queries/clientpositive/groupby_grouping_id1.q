SET hive.vectorized.execution.enabled=false;

CREATE TABLE T1_n158(key STRING, val STRING) STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '../../data/files/T1.txt' INTO TABLE T1_n158;

-- SORT_QUERY_RESULTS

SELECT key, val, GROUPING__ID from T1_n158 group by key, val with cube;
SELECT key, val, GROUPING__ID from T1_n158 group by cube(key, val);

SELECT GROUPING__ID, key, val from T1_n158 group by key, val with rollup;
SELECT GROUPING__ID, key, val from T1_n158 group by rollup (key, val);

SELECT key, val, GROUPING__ID, CASE WHEN GROUPING__ID == 0 THEN "0" WHEN GROUPING__ID == 1 THEN "1" WHEN GROUPING__ID == 2 THEN "2" WHEN GROUPING__ID == 3 THEN "3" ELSE "nothing" END from T1_n158 group by key, val with cube;
SELECT key, val, GROUPING__ID, CASE WHEN GROUPING__ID == 0 THEN "0" WHEN GROUPING__ID == 1 THEN "1" WHEN GROUPING__ID == 2 THEN "2" WHEN GROUPING__ID == 3 THEN "3" ELSE "nothing" END from T1_n158 group by cube(key, val);

