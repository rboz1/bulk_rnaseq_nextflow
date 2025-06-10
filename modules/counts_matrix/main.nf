#!usr/bin/env nextflow

process COUNTS_MATRIX{
    container "ghcr.io/bf528/pandas:latest"
    publishDir params.outdir

    input:
    path(counts)

    output:
    path("*.csv")

    script:
    """
    counts_matrix.py -i $counts -o "counts.csv"
    """
}