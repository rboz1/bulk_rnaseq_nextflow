#!usr/bin/env nextflow

process VERSE{
    container "ghcr.io/bf528/verse:latest"
    publishDir params.outdir
    cache 'lenient'

    input:
    tuple val(name), path(bam)
    path(gtf)

    output:
    // path("${name}.exon.summary.txt")
    path("${name}.exon.txt"), emit: counts

    shell:
    """
    verse -a $gtf -o "${name}" -S $bam
    """
}