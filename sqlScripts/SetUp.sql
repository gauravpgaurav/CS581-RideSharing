CREATE database CS581GROUP6;
USE CS581GROUP6;

CREATE TABLE DESTINATION(
destID varchar(10), 
destLat DECIMAL(23,20), 
destLong DECIMAL(23,20), 
timeFromSrc double, 
distFromSrc double, 
PRIMARY KEY(destID)
);

CREATE TABLE POOLING_WINDOW(
poolingWindowID varchar(10),
poolingStartTime DATETIME,
poolingDuration tinyint,
poolingWindowSize int,
poolingWindowComputeTime double,
PRIMARY KEY(poolingWindowID)
);

CREATE TABLE REQUESTS(
reqID varchar(10), 
numberOfPassengers tinyint, 
isWillingToWalk tinyint, 
destID varchar(10), 
maxDelay int, 
maxWalkTime int,
requestTime DATETIME, 
indvRideTime long, 
indvRideDist double,
indvRideCost DECIMAL(13,4),
poolingWindowID varchar(10),
PRIMARY KEY(reqID),
FOREIGN KEY (destID) REFERENCES DESTINATION(destID),
FOREIGN KEY (poolingWindowID) REFERENCES POOLING_WINDOW(poolingWindowID)
);

CREATE TABLE RIDES(
reqID varchar(10), 
rideID varchar(10), 
isSharing tinyint, 
sharedRideTime long, 
sharedRideDist double,
sharedRideCost DECIMAL(13,4),
poolingWindowID varchar(10),
PRIMARY KEY(reqID, rideID),
FOREIGN KEY (reqID) REFERENCES REQUESTS(reqID),
FOREIGN KEY (poolingWindowID) REFERENCES POOLING_WINDOW(poolingWindowID)
);

CREATE TABLE DESTINATION_CACHE(
destID1 varchar(10), 
destID2 varchar(10), 
time1to2 double, 
dist1to2 double, 
PRIMARY KEY(destID1, destID2),
FOREIGN KEY (destID1) REFERENCES DESTINATION(destID),
FOREIGN KEY (destID2) REFERENCES DESTINATION(destID)
);