import os
import csv
import glob
import sys
from operator import itemgetter
import numpy as np
import time


optane_energy = 0
substring="OPTANE"

#OPTANE --> bank 2 and bank 8

extension = 'csv'
os.chdir(sys.argv[2]+"/results/energy/")
bank_files = glob.glob('*.{}'.format(extension))

for file_name in bank_files:
    bank_number = file_name.split("_")[1].split(".")[0]
    if int(bank_number)%2==0:
        bank_socket = "S0"
    else:
        bank_socket = "S1"
    with open(file_name, 'r') as out_file:
        reader = csv.reader(out_file,delimiter=';')
        for row in reader:
            if(row):
                if(row[0] == bank_socket):
                    try:
                        x=row[2]
                    except:
                        break
                    if(substring in row[2]):
                        optane_energy=optane_energy+float(row[2].split(" ")[4])
                        #print(optane_energy)

#export_data = zip_longest(*d, fillvalue = '')
timestr = time.strftime("%Y%m%d-%H%M%S")
output_file = open(sys.argv[2]+"/results/energy/energy-" + str(sys.argv[1])+"-"+ str(timestr) + ".out","w") #write mode
output_file.write("OPTANE: " + str(optane_energy) +" Joules")
output_file.write("\n")
output_file.close()

print("Output for Intel Optane energy consumption is stored on " + sys.argv[2]+"/results/energy/energy-" + str(sys.argv[1])+"-"+ str(timestr) + ".out")