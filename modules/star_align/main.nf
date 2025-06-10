#!usr/bin/env nextflow

process STAR_ALIGN {
    container "ghcr.io/bf528/star:latest"
    label "process_high"
    publishDir params.outdir
    cache 'lenient'

    input:
    tuple val(name), path(fastq)
    path(genome)

    output:
    tuple val(name), path("${name}_*.bam"), emit: bam
    path("${name}_*Log.final.out"), emit: log

    shell:
    """
    STAR --runThreadN $task.cpus --genomeDir $genome --readFilesIn ${fastq.join(",")} --readFilesCommand zcat --outFileNamePrefix "${name}_" --outSAMtype BAM SortedByCoordinate
    """
}