import pandas as pd
import multiprocessing as mp
import numpy as np
from datetime import datetime



#def Tabulate(s):
#
#    s2 = str(s)
#    s2 = s2.strip()
#    s2 = s2.replace('\\"',"'")
##    s2 = s2.replace('"','!@!')
##    s2 = s2.replace("<",'!@!')
##    s2 = s2.replace(">",'!@!')
##    x = s2.split("!@!")
#    x = s2.split(" ")
#    x = list(filter(None, x))
#    x = list(filter(lambda a: a[0] == '"' or a[0] == "<" or a[0:2] == "_:", x))
##    x = list(filter(lambda a: a.strip() != ".", x))
##    x = list(filter(lambda a: a.strip() != "@en", x))
##    x = list(filter(lambda a: a.strip() != "^^", x))
##    for i in x:
##        if i != \" \" and i != " .":
##		c[i] += 1
#
#    if len(x) < 3 and len(x) > 4:
#        print("Inaccurate Tabulation: \n " + s)
#        print(x)
#        print()
#
#    if len(x) >= 4:
#        return x[0],  3
#    elif len(x) <= 3:
#        return x[0], 2



t1 = datetime.now()



files = []
s = r"C:\Users\Khaled\Documents\AUEB\Data Mgt\ass2\part1\hw2-rdf-2016_test.txt"
files.append(s)


tdf = pd.DataFrame(columns = ['SUBJECT', 'EDGES'])
chunkk = 50000
for ii, f in enumerate(files):
    i = 0
    reader = pd.read_table(f, header=None,  chunksize = chunkk)
    for df in reader:
        
        df = df[0].str.split(" ", expand=True)
        df['EDGES'] = df.stack().str.contains(r'^\"|<|_:').astype(np.uint8).sum(level=0)-1
        df[df['EDGES'] >= 3] = 3
        df[df['EDGES'] <= 2] = 2
        df.rename(columns={0:'SUBJECT'}, inplace=True)

        tdf = tdf.append(df[['SUBJECT','EDGES']], ignore_index=True)
        del df
        tdf = tdf.groupby('SUBJECT', as_index=False).sum()
        i += chunkk
        print("Completed " + str(i) + " rows from file #" + str(ii +1))
        if i >= 100000:
            break

tdf['y'] = 1
tdf = tdf[['EDGES','y']].groupby('EDGES', as_index=False).sum()
#tdf['bucket'] = pd.qcut(tdf.EDGES, 20)
#tdf = tdf[['bucket','y']].groupby('bucket').sum()

#tdf.plot(kind='bar')

print(tdf)
print(tdf.shape)


#zdf is ready with all subjects, and with count o
print("Script took " + str(datetime.now() - t1) + " Seconds ")