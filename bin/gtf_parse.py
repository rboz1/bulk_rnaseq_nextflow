#!/usr/bin/env python

import argparse
import pandas as pd

# here we are initializing the argparse object that we will modify
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--input", help='a FASTA file containing a genomic sequence', dest="input", required=True)
parser.add_argument("-o", "--output", help='The output file where we will write our statistics', dest="output", required=True)

# this method will run the parser and input the data into the namespace object
args = parser.parse_args()
gtf_file = args.input
output_file = args.output

gtf_dict = {}

with open(gtf_file, "r") as file:
    for _ in range(5):
        next(file)
    
    for line in file:
        spl_line = line.split("\t")[8].split(";")
        ensembl_id = spl_line[0].split('"')[1]
        gene_name = spl_line[3].split(" ")[2].replace('"', "")
        gtf_dict[ensembl_id] = gene_name

ensembl_gene = pd.DataFrame.from_dict(gtf_dict, orient="index", columns=["gene_name"]).reset_index()
ensembl_gene.rename(columns={"index": "ensembl_id"}, inplace=True)

ensembl_gene.to_csv(output_file, sep=' ', index=False)