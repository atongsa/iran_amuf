#!/usr/bin/env bash
#SBATCH -J div.at42_id #sm_sp.at42_id_1.at42_id_2
#SBATCH -p Gnode # Fnode2/Fnode1/Gnode/Cnode; kdy:xhacnormala
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -o %j.o
#SBATCH -e %j.e

# cd
cd /public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/msmc_div_df

# df
```py3
#!/usr/bin/env python3

import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

mu = 1.51e-8
gen = 3
dir = "/public/home/d0202110815/at42/proj/iran_amuf/demo_graphy/chr_auto/msmc2/msmc_div"
pop_n = sys.argv[1]
op_n = pop_n + ".plot.tsv"

msmc2_df = pd.read_csv("{}/combine.{}.final.txt".format(dir, pop_n), sep='\t', header=0)

time_years = gen * ((msmc2_df.left_time_boundary + msms2_df.right_time_boundary)/2)/mu

ne_1 = (1/msms2_df.lambda_00)/(2*mu)
ne_2 = (1/msms2_df.lambda_11)/(2*mu)

relativeCCR = 2 * msmc2_df.lambda_01 / (msmc2_df.lambda_00 + msmc2_df.lambda_11)

def getCCRintersect(df, val):
    xvec = df.time_years
    yvec = df.relativeCCR
    i = 0
    while yvec[i] < val:
        i += 1
        assert i > 0 and i <= len(yvec), "CCR index out bounds {}".format(i)
        if yvec[i-1] < val and yvec[i] >= val:
            break
    intersectDistance = (val - yvec[i-1]) / (yvec[i] - yvec[i-1])
    return xvec[i-1] + intersectDistance * (xvec[i] - xvec[i-1])

#a=[1,2,3,4]; b=[1,1,1,1]; c=[1,1,1,1]; d=[0,0.4,0.8,1]
#data = {"time_years":a, 'ne_1':b, 'ne_2':c, 'relativeCCR':d}
data = {"time_years":time_years, 'ne_1':ne_1, 'ne_2':ne_2, 'relativeCCR':relativeCCR}
df_n = pd.DataFrame(data)

cut_year = getCCRintersect(df_n, 0.5)

df_n2 = df_n.copy()
df_n2['cut_year'] = cut_year

df_n2.to_csv(op_n, sep='\t', index=False, header=True)

```

# kk
df_n.iat[0,3] = 0
df_n.iat[1,3] = 1
