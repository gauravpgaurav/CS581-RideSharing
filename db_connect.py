import configparser
import MySQLdb
from sqlalchemy import create_engine
import pandas as pd

class DatabaseConnect():
   def __init__(self,database,hostname,username,password,port):

       self.hostname = hostname
       self.username = username
       self.password = password
       self.port = port
       self.database = database
       self.engine = create_engine("mysql+pymysql://{}:{}@{}:{}/{}".format(self.username,
                                                                           self.password,
                                                                           self.hostname,
                                                                           self.port,
                                                                           self.database))

   def connection_obj(self):
       connection = self.engine.connect()
       return connection

   def query(self,sql_str,df_flag=True,parse_dates=None,chunksize=None,columns=None):
       '''
       sql_str(str): query to be fetched from data base
       returns a pandas dataframe that contains query results
       '''
       try:
           connection = self.connection_obj()
           if df_flag == True:
               df = self.to_dataframe(sql_str,connection,parse_dates,chunksize=None)
               return df
           else:
               connection.execute(sql_str)
           connection.close()
       except:
           raise Exception


   def to_dataframe(self,sql_str, connection, parse_dates=None, chunksize=None):
       df = pd.read_sql(sql_str,con=connection,parse_dates=parse_dates,chunksize=None)
       return df

   def insert(self,df,tbl,chunksize=None):
       '''
       df(pd.DataFrame): df to be inserted
       tbl(str): table in database to insert df into
       '''
       try:
           connection = self.connection_obj()
           df.to_sql(name=tbl,con=connection,if_exists='append',index=False,chunksize=None)
           connection.close()
       except:
           raise Exception