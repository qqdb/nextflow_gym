process build {
    publishDir "results", saveAs: { filename -> filename.endsWith(".gz") ? "zips/$filename" : filename }

    input:
    tuple val(sampleId), file(reads)

    output:
    path '*'

    script:
    """
    cat ${reads[0]} > read1.fq
    cat ${reads[1]} > read2.fq.gz
    """
}

workflow {
    Channel
        .fromFilePairs("../input/*_{1,2}.fq")
        .view()
        .set { fq_ch }

    build(fq_ch)
}