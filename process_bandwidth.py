import os
import csv
import glob
import sys
from operator import itemgetter
import numpy as np
import pandas as pd
from itertools import zip_longest
import time


print(sys.argv[2])
df = pd.read_csv(sys.argv[2]+"/results/bandwidth/memory_bandwidth.csv", on_bad_lines='skip', low_memory=False)


skt0_read_pmm_list = df['SKT0.10'].tolist()
skt0_write_pmm_list = df['SKT0.11'].tolist()
skt1_read_pmm_list = df['SKT1.14'].tolist()
skt1_write_pmm_list = df['SKT1.15'].tolist()

system_read_pmm_list = []
system_write_pmm_list = []
#print(timestamp,skt1_write_pmm_list)

for i in range(len(skt0_read_pmm_list)):
	if i == 0:
		continue

	system_read_pmm_list.append(float(skt0_read_pmm_list[i]) + float(skt1_read_pmm_list[i]))
	system_write_pmm_list.append(float(skt0_write_pmm_list[i]) + float(skt1_write_pmm_list[i]))



d = [system_read_pmm_list, system_write_pmm_list]
export_data = zip_longest(*d, fillvalue = '')
timestr = time.strftime("%Y%m%d-%H%M%S")
outf = sys.argv[2]+"/results/bandwidth/bandwidth-" + str(sys.argv[1])+"-"+ timestr + ".csv"
with open(outf, 'w', encoding="ISO-8859-1", newline='') as myfile:
      wr = csv.writer(myfile)
      wr.writerow(("Read Throughgput(MB/s)", "Write Throughgput(MB/s)"))
      wr.writerows(export_data)

myfile.close()

print("Output for memory bandwidth is stored on " + outf)