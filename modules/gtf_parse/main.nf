#!usr/bin/env nextflow

process GTF_PARSE {
    container "ghcr.io/bf528/pandas:latest"
    publishDir params.outdir

    input:
    path(gtf)

    output:
    path("*txt")

    script:
    """
    gtf_parse.py -i $gtf -o "*.txt"
    """
}