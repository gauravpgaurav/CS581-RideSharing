# CS581-RideSharing
- Uses MySQL and Python
- Fixed Source: JFK
- Destinations: Manhattan Boroughs
- Walking considered for requests
- Merges at most 2 requests such that -
    - Overall mileage/money is saved
    - Occupancy constraint is satisfied
    - Delay constraint is satisfied
    - Walk time does not exceed the limit
                

<!--**Table of Contents**

[TOCM]

[TOC]-->

                
## 1. Prerequisite Setup
##### Tools to be installed-
1. [MySQL/MySQL Workbench](https://dev.mysql.com/downloads/workbench/)
2. [Python](https://www.python.org/downloads/)
3. [Jupyter Notebook](https://jupyter.org/install)
4. [Clone CS581-RideSharing](https://github.com/guptaaditya18/CS581-RideSharing)
    5. [Cloning a Repository](https://help.github.com/en/articles/cloning-a-repository)
                
## 2. Database Setup
- Use `sqlScripts/SetUp.sql` to create the `CS581GROUP6` database and the following tables-

##### 1. DESTINATION

| destID | destLat | destLong | timeFromSrc | distFromSrc |
| --- | --- | --- | --- | --- |
| Primary Key  | Latitude  | Longitude  | Time from JFK in Seconds | Distance from JFK in Meters |

##### 2. POOLING_WINDOW

| poolingWindowID  | poolingStartTime | poolingDuration | poolingWindowSize | poolingWindowComputeTime |
| --- | --- | --- | --- | --- |
| Primary Key  | Start Time for Pooling Window  | Duration of Pooling Window  | Number of Requests in Pooling Window | Time to process Pooling Window |

##### 3. REQUESTS

| reqID  | numberOfPassengers | isWillingToWalk | destID | maxDelay | maxWalkTime | requestTime | indvRideTime | indvRideDist | indvRideCost | poolingWindowID |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| Primary Key  | Number of passengers  | Is Willing to Walk?  | Foreign Key - Corresponding Destination | Max acceptable delay time | Max acceptable walking time | Timestamp of Request | Individual Ride Time | Individual Ride Distance | Individual Ride Fare | Foreign Key - Corresponding Pooling Window |

##### 4. RIDES

| reqID  | rideID | isSharing | sharedRideTime | sharedRideDist | sharedRideCost | poolingWindowID |
| --- | --- | --- | --- | --- | --- | --- |
| Primary Key, Foreign Key - Corresponding Request  | Primary Key  | Is Shared Ride?  | Shared Ride Time | Shared Ride Distance | Shared Ride Fare | Foreign Key - Corresponding Pooling Window |

##### 5. DESTINATION_CACHE

| destID1  | destID2 | time1to2 | dist1to2 |
| --- | --- | --- | --- |
| Primary Key, Foreign Key - Corresponding Destination  | Primary Key  Foreign Key - Corresponding Destination | Time from Destination 1 to Destination 2 in Seconds | Distance from Destination 1 to Destination 2 in Meters |

- Use Table Data Import Wizard in MySQL Workbench to populate tables: `DESTINATION` and `DESTINATION_CACHE` using 
    - [PrecomputedData/DESTINATION.csv](https://github.com/guptaaditya18/CS581-RideSharing/blob/master/PrecomputedData/DESTINATION.csv)
    - [PrecomputedData/DESTINATION_CACHE.csv](https://github.com/guptaaditya18/CS581-RideSharing/blob/master/PrecomputedData/DESTINATION_CACHE.csv)
                
## 3. Data Preprocessing Stage
- Execute `RideSharing - Processing.ipynb` after providing the desired `startDate` and `endDate` and path to the correct month csv
- Keep note of filtered data CSV filename
                
## 4. Execution Stage
- Execute `RideSharing - Main.ipynb` after providing the filtered data CSV filename from the previous notebook
                
## 5. Evaluation Stage
- Execute `RideSharing - Evaluation.ipynb` after providing the desired `startDate` and `endDate`
