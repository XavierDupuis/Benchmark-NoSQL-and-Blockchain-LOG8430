import os
import glob

folder_path = r'./cassandra/out'
file_type = r'\*txt'
files = glob.glob(folder_path + file_type)
most_recent_file = max(files, key=os.path.getctime)
f = open(most_recent_file, "r") 

ITERATION_HEADER = "ITERATION"
WORKLOAD_HEADER = "WORKLOAD"
DATA_HEADER = "["

iteration=None
workload=None
lines = f.readlines()

data = {}
for line in lines:
    field, arg1, arg2 = line.split(",")
    if(field==WORKLOAD_HEADER):
        workload=arg1
        data[workload] = {}
    elif(field==ITERATION_HEADER):
        iteration=arg1
    elif(field[0]==DATA_HEADER):
        category = field.strip("[]")
        if(category not in data[workload]):
            data[workload][category] = {}
        attribute = arg1.strip()
        value = float(arg2.strip())
        if(attribute in data[workload][category]):
            data[workload][category][attribute].append(value)
        else:
            data[workload][category][attribute] = [value]
    else:
        print("Error : Line not parsed : '" + line + "'")


stats = {}
for workload in data.keys():
    w = data[workload]
    stats[workload] = {}
    for category in w.keys():
        c = w[category]
        stats[workload][category] = {}
        for attribute in c.keys():
            a = c[attribute]
            stats[workload][category][attribute] = {}
            mean = sum(a) / len(a)
            variance = sum([((x - mean) ** 2) for x in a]) / len(a)
            stats[workload][category][attribute]["mean"] = mean
            stats[workload][category][attribute]["stdev"] = variance ** 0.5

for workload in data.keys():
    w = data[workload]
    stats[workload] = {}
    for category in w.keys():
        c = w[category]
        stats[workload][category] = {}
        for attribute in c.keys():
            a = c[attribute]
            stats[workload][category][attribute] = {}
            mean = sum(a) / len(a)
            variance = sum([((x - mean) ** 2) for x in a]) / len(a)
            stats[workload][category][attribute]["mean"] = mean
            stats[workload][category][attribute]["stdev"] = variance ** 0.5

