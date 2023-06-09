process mergeFile {
    debug true

    input:
    path file

    output:
    path 'result.fq'

    script:
    """
    cat $file > result.fq
    """
}

workflow {
    Channel.fromPath("../input/*_1.fq") \
    | mergeFile \
    | collectFile \
    | view
}