process build {
    debug true
    input:
    tuple val(sampleId), file(read1), file(read2)

    script:
    """
    echo "$sampleId, $read1, $read2"
    """
}

workflow {
    Channel
        .fromPath('data.csv')
        .splitCsv(header: true)
        .map {
            row ->
            tuple(row.sampleId, file(row.read1), file(row.read2))
        }
        .set {input_ch}
    build(input_ch)
}