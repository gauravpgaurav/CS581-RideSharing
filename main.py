from datetime import datetime
import numpy as np

df = pd.read_csv('RideSharingData/filtered_data.csv')

df['tpep_pickup_datetime'] = [datetime.strptime(pickup_time, '%Y-%m-%d %H:%M:%S') 
                                          for pickup_time in df['tpep_pickup_datetime']]

df['tpep_dropoff_datetime'] = [datetime.strptime(dropoff_time, '%Y-%m-%d %H:%M:%S') 
                                          for dropoff_time in df['tpep_dropoff_datetime']]
df['destination_id'] = df.apply(getdestid, index=['dropoff_latitude', 'dropoff_longitude'])
#df['pool_window'] = df.apply(getpoolingwindow)
#df['walking_time'] = df.apply(getWalkingTime)
df['cost'] = cost_function(df['trip_distance'], df.iloc[:,3], False)
#df['delay_time'] = df.apply(getDelay)
