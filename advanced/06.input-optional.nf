params.filter = "NO_FILE"

process filterReads {
    debug true   
    input:
    path seq
    path opt

    script:
    def filter = opt.name != 'NO_FILE' ? "--filter $opt" : ''
    """
    echo your_commad --input $seq $filter
    """
}

workflow {
    Channel.fromPath("../input/*.fa", checkIfExists:true).set {reads_fq}
    filterReads(reads_fq, file(params.filter))
}