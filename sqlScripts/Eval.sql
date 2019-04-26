
-- MAIN CACHE
SELECT COUNT(*) FROM DESTINATION_CACHE;
-- END MAIN

SELECT destID, count(*) as count FROM REQUESTS group by destID  ORDER BY count DESC ;

SELECT avg(poolingWindowSize), avg(poolingWindowComputeTime) FROM POOLING_WINDOW WHERE poolingWindowSize IS NOT NULL;
SELECT max(poolingWindowSize), poolingWindowComputeTime FROM POOLING_WINDOW WHERE poolingWindowSize IS NOT NULL;
-- SELECT avg(poolingWindowComputeTime) FROM POOLING_WINDOW WHERE poolingWindowComputeTime IS NOT NULL;

SELECT COUNT(*) FROM POOLING_WINDOW WHERE poolingWindowComputeTime IS NOT NULL;
SELECT * FROM POOLING_WINDOW WHERE poolingWindowID = '40330';
SELECT max(poolingWindowID) FROM POOLING_WINDOW WHERE poolingWindowComputeTime IS NOT NULL;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM RIDES;
DELETE FROM REQUESTS;
DELETE FROM POOLING_WINDOW;