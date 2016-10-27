import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

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

jan=pd.read_csv(january, dtype='str')
feb=pd.read_csv(february, dtype='str')
mar=pd.read_csv(march, dtype='str')
apr=pd.read_csv(april, dtype='str')
may=pd.read_csv(may, dtype='str')
jun=pd.read_csv(june, dtype='str')
jul=pd.read_csv(july, dtype='str')
sep=pd.read_csv(september, dtype='str')
aug=pd.read_csv(august,dtype='str')
oct=pd.read_csv(october, dtype='str')
nov=pd.read_csv(november, dtype='str')
dec=pd.read_csv(december, dtype='str')

frames=[jan,feb,mar,apr,may,jun,jul,sep,oct,nov,dec]
flights = pd.concat(frames,axis=0, ignore_index=True)

flightstest=flights.drop('YEAR',axis=1)
