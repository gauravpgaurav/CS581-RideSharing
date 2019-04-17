USE CS581GROUP6;

INSERT INTO DESTINATION values('DEST1',-73.928387000000001,40.881405000000001,1772777.000000000000000,38658.841000000000349);
INSERT INTO DESTINATION_CACHE values('DEST1','DEST2',123,500);

SELECT * FROM DESTINATION;
SELECT * FROM DESTINATION_CACHE;
-- MAIN CACHE
SELECT COUNT(*) FROM DESTINATION_CACHE;
-- END MAIN
SELECT COUNT(*) FROM DESTINATION_CACHE WHERE destID1=destID2;
SELECT * FROM DESTINATION_CACHE as c1,DESTINATION_CACHE as c2 WHERE c1.destID1=c2.destID2 and c1.destID2=c2.destID1 and c1.destID1!=c1.destID2;

SELECT * FROM REQUESTS;
SELECT COUNT(*) FROM REQUESTS;
SELECT * FROM RIDES where poolingWindowID = 110;
SELECT COUNT(*) FROM RIDES;
SELECT * FROM RIDES;

SELECT * FROM REQUESTS NATURAL JOIN RIDES;
SELECT * FROM POOLING_WINDOW;
SELECT * FROM POOLING_WINDOW WHERE poolingWindowID = "2680";
SELECT COUNT(*) FROM POOLING_WINDOW WHERE poolingWindowComputeTime IS NOT NULL;

SET SQL_SAFE_UPDATES = 0;
-- DELETE FROM DESTINATION;
DELETE FROM RIDES;
-- DELETE FROM REQUESTS;
-- DELETE FROM POOLING_WINDOW;

-- DROP TABLE RIDES;
-- DROP TABLE REQUESTS;
-- DROP TABLE POOLING_WINDOW;
-- DROP TABLE DESTINATION;