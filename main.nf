#!/usr/bin/env nextflow

include { FASTQC } from './modules/fastqc'
include { STAR_INDEX } from './modules/star_index'
include { GTF_PARSE } from './modules/gtf_parse'
include { STAR_ALIGN } from './modules/star_align'
include { MULTIQC } from './modules/multiqc'
include { VERSE } from './modules/verse'
include { COUNTS_MATRIX } from './modules/counts_matrix'

workflow {
    Channel.fromFilePairs(params.reads)
    | set{ align_ch }

    Channel.fromFilePairs(params.reads).transpose()
    | set{ fastqc_ch }

    FASTQC(fastqc_ch)

    STAR_INDEX(params.genome, params.gtf)
    GTF_PARSE(params.gtf)

    STAR_ALIGN(align_ch, STAR_INDEX.out.index)

    aligned = STAR_ALIGN.out.log
    zip = FASTQC.out.zip

    zip.mix(aligned).collect()
    | set{ multiqc_ch }

    MULTIQC(multiqc_ch)

    VERSE(STAR_ALIGN.out.bam, params.gtf)

    COUNTS_MATRIX(VERSE.out.counts.collect())
}
