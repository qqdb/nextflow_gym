process build {
    publishDir "output/$sampleId"

    input:
    tuple val(sampleId), file(reads)

    output:
    path '*.fq'

    script:
    """
    cat ${reads[0]} > sample_1.fq
    cat ${reads[1]} > sample_2.fq
    """
}

workflow {
    Channel
        .fromFilePairs("../input/*_{1,2}.fq", checkIfExists: true)
        .set { fq_ch }

    build(fq_ch)
}

