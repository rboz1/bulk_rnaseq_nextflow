#!/usr/bin/env nextflow

process STAR_INDEX {
    container 'ghcr.io/bf528/star:latest'
    publishDir params.outdir
    label "process_high"
    
    input:
    path(genome)
    path(gtf)

    output:
    path("star"), emit: index

    shell:
    """
    mkdir star
    STAR --runThreadN $task.cpus --runMode genomeGenerate --genomeDir star --genomeFastaFiles $genome --sjdbGTFfile $gtf
    """

}