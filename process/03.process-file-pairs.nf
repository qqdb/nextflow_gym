process filePair {
    debug true

    input:
    tuple val(sampleId), file(reads)

    script:
    """
    echo "$sampleId, $reads"
    """
}

workflow {
    fq_ch = Channel.fromFilePairs("../input/*.fq")
    filePair(fq_ch)
}