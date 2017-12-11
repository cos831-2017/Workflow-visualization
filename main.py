import pymonetdb
import random
import sys
import argparse
from bokeh.io import output_file, show
from bokeh.models import ColumnDataSource
from bokeh.plotting import figure

# Try to fetch input
try:
    file = open(sys.argv[1])
except:
    file = open("sample.sql")

# Handle arguments
parser = argparse.ArgumentParser()
parser.add_argument("-db", "--database", help="Database name")
parser.add_argument("-u", "--username", help="User name")
parser.add_argument("-pw", "--password", help="Password")
parser.add_argument("-hn", "--hostname", help="Hostname")
args = parser.parse_args()

# DB connection
connection = pymonetdb.connect(
    username = args.username if args.username else "monetdb", 
    password = args.password if args.password else "monetdb", 
    hostname = args.hostname if args.hostname else "localhost", 
    database = args.database if args.database else "voc")
cursor = connection.cursor()
cursor.arraysize = 500
output_file("output.html")

# Initializations
dataset = []
data = {}
data_length = 0
labels = []
legend = []
colors = []
row_lengths = []

# Each query in file
for query in file:
    # Use table name as label
    operation = query.split('from')[1].split(" ")[1]
    
    # In case of duplicate:
    i=2
    while operation in dataset:
        operation = operation+str(i)
        i+=1

    # Initilizations
    dataset.append(operation)
    selections = []
    row_length = 0
    
    # Fetch query
    cursor.execute(query)
    q=cursor.fetchall()
    q.sort()
    selections += q

    # Each data extracted from query
    for selection in selections:
        qlabel = str(selection[0])
        qdata = int(selection[1])
        row_length += qdata
        if qlabel not in labels:
            labels.append(qlabel)
        if qlabel.replace("_"," ")+" " not in legend:
            legend.append(qlabel.replace("_"," ")+" ")
        try:
            if len(data[qlabel]) < len(row_lengths):
                data[qlabel] += [0]*(len(row_lengths)-len(data[qlabel]))+[qdata]
            else:
                data[qlabel] += [qdata]
        except:
            data[qlabel] = [0]*len(row_lengths)+[qdata]
    row_lengths.append(row_length)

# Fill empty values
for key in data:
    if len(data[key]) < len(row_lengths):
        data[key] += [0]*(len(row_lengths)-len(data[key])) 
    data[key].reverse()

# Generate colors according to # of labels
for index in range(len(legend)):
    colors.append("rgb(%d,%d,%d)"%(
        255*index/len(legend),
        255/(index+1),
        255*(len(legend)-index)/len(legend)))

# Reverse data to follow up-down order 
dataset.reverse()
data['dataset'] = dataset

# Plotting config
out = figure(
    x_range=(0,max(row_lengths)*1.5), 
    y_range=dataset, 
    plot_height=len(row_lengths)*100, 
    title="Workflow",
    toolbar_location=None)

out.hbar_stack(
    tuple(labels),
    y='dataset', 
    height=0.9, 
    color=colors, 
    source=ColumnDataSource(data),
    legend=legend,
    line_color=colors,
    line_width=1)

out.y_range.range_padding = 0.1
out.ygrid.grid_line_color = None
out.legend.location = "top_right"
out.axis.minor_tick_line_color = None
out.outline_line_color = None

show(out)