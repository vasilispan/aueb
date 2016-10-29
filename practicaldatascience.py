import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
#csvs are placed in folder, named appropriately during download
january = 'nodiverts/january.csv'
february = 'nodiverts/february.csv'
march = 'nodiverts/march.csv'
april = 'nodiverts/april.csv'
may = 'nodiverts/may.csv'
june ='nodiverts/june.csv'
july ='nodiverts/july.csv'
august ='nodiverts/august.csv'
september ='nodiverts/september.csv'
october ='nodiverts/october.csv'
november = 'nodiverts/november.csv'
december = 'nodiverts/december.csv'

#import all csv files
jan=pd.read_csv(january,usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
feb=pd.read_csv(february, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
mar=pd.read_csv(march, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
apr=pd.read_csv(april, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST','DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
may=pd.read_csv(may, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
jun=pd.read_csv(june, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
jul=pd.read_csv(july, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
sep=pd.read_csv(september, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
oct=pd.read_csv(october, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
nov=pd.read_csv(november, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})
dec=pd.read_csv(december, usecols=['MONTH','CARRIER','FLIGHTS','ORIGIN','DEST', 'DEP_DELAY_NEW'], dtype={'FLIGHTS':np.int32})

#concatenate all dataframes to one for the year 2015
frames=[jan,feb,mar,apr,may,jun,jul,sep,oct,nov,dec]
flights = pd.concat(frames,axis=0, ignore_index=True)
#get sum of flights per airport
flights_per_airport= flights.groupby(by=['ORIGIN'])['FLIGHTS'].sum()
#map previous to 2015 dataframe
flights['FLIGHTS_SUM'] = flights['ORIGIN'].map(flights_per_airport)
# drop rows where we have <0.01
flights2 = flights[flights.FLIGHTS_SUM > np.percentile(flights_per_airport,1)]
flights2 = flights2.reset_index()
#drop unnecessary columns for question1
flights2=flights2.drop({'index','MONTH','CARRIER','DEST','FLIGHTS','FLIGHTS_SUM'},1)
#and BAM we have 4 airports gone
flights.ORIGIN.describe()  # -> unique 322
flights2.ORIGIN.describe() # -> unique 317

