#!/usr/bin/env python

# lib
import os
import pandas as pd
from sklearn.cluster import KMeans

# args
w_d = "/public/home/d0202110815/at42/proj/iran_sheep/structure/kmean"
df_f = 'iran_sheep.amuf.eigenvec'

# cd
os.chdir(w_d)

# read
df = pd.read_csv(df_f, sep=' ', header=None)

# clean
df1 = df.iloc[:,1:4]
df2 = df1.set_index(1)

# stat
km = KMeans(n_clusters=2).fit(df2)

cluster_map = pd.DataFrame()
cluster_map['data_index'] = df2.index.values
cluster_map['cluster'] = km.labels_

# write
cluster_map.to_csv('iran_sheep.amuf.kmean2.tsv', sep='\t', index=False, header=False)

# kk
# https://datatofish.com/k-means-clustering-python/
