select poolingWindowID, sum(indvRideDist) as sum_indv_rides, sum(sharedRideDist) as sum_shared_rides 
from rides as rd left join REQUESTS as rq on rd.reqID = rq.reqID group by poolingwindowid;


select poolingWindowID, count(indvRideDist) as total_indv_rides, count(sharedRideDist) as total_shared_rides from rides as rd right join REQUESTS as rq on rd.reqID = rq.reqID right join POOLING_WINDOW as pw on rq.poolingwindowid = pw.poolingwindowid  where pw.poolingstarttime >= str_to_date('{}','%y-%m-%d %H:%i:%S') and pw.poolingstarttime >= str_to_date('{}','%y-%m-%d %H:%i:%S') group by pw.poolingwindowid;

select count(*) from requests ;
select count(distinct rideID) from RIDES;