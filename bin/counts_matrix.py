#!/usr/bin/env python

import argparse
import os
import pandas as pd

# here we are initializing the argparse object that we will modify
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", help="List of .txt files to merge", dest="input", required=True, nargs='+')
parser.add_argument("-o", "--output", help='output csv file', dest="output", required=True)

# this method will run the parser and input the data into the namespace object
args = parser.parse_args()
verse_files = args.input
output_file = args.output


# read in first file
first_file = verse_files[0]
first_basename = os.path.basename(first_file).split(".")[0]

merged_df = pd.read_csv(first_file, delimiter="\t", names=["gene", first_basename], skiprows=1)

for file in verse_files[1:]:
    basename = os.path.basename(file).split(".")[0]
    temp_df = pd.read_csv(file, delimiter="\t", names=["gene", basename], skiprows=1)
    merged_df = merged_df.merge(temp_df, how="inner", on="gene")

merged_df.to_csv(output_file, index=False)



