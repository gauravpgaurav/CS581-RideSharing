CREATE database CS581GROUP6;
USE CS581GROUP6;

CREATE TABLE DESTINATION(
destID varchar(10), 
destLat DECIMAL(23,20), 
destLong DECIMAL(23,20), 
timeFromSrc long, 
distFromSrc double, 
PRIMARY KEY(destID)
);

CREATE TABLE REQUESTS(
reqID varchar(10), 
numberOfPassengers tinyint, 
isWillingToWalk tinyint, 
destID varchar(10), 
maxDelay int, 
requestTime TIMESTAMP, 
indvRideTime long, 
indvRideDist double,
indvRideCost DECIMAL(13,4),
PRIMARY KEY(reqID),
FOREIGN KEY (destID) REFERENCES DESTINATION(destID)
);

CREATE TABLE RIDES(
reqID varchar(10), 
rideID varchar(10), 
isSharing tinyint, 
sharedRideTime long, 
sharedRideDist double,
sharedRideCost DECIMAL(13,4),
PRIMARY KEY(reqID, rideID),
FOREIGN KEY (reqID) REFERENCES REQUESTS(reqID)
);