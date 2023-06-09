params.reads = "../input/*_{1,2}.fq"
params.outdir = "result"

process build {
    publishDir "${params.outdir}/${sampleId}/counts", pattern: '*_counts.txt'
    publishDir "${params.outdir}/${sampleId}/head", pattern: '*_head.txt'
    publishDir "${params.outdir}/${sampleId}", pattern: '*.fq'

    input:
    tuple val(sampleId), file(reads)

    output:
    file '*'

    script:
    """
    awk '{s++}END{print s/4}' ${reads[0]} > read1_counts.txt
    awk '{s++}END{print s/4}' ${reads[1]} > read2_counts.txt
    head -n 50 ${reads[0]} > read1_head.txt
    head -n 50 ${reads[1]} > read2_head.txt
    cat ${reads[0]} > read1.fq
    cat ${reads[1]} > read2.fq
    """

}

workflow {
    Channel
        .fromFilePairs(params.reads, checkIfExists: true)
        .set { fq_ch }

    build(fq_ch)
}