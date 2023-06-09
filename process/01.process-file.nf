process getFastQ {
    input:
    path x
    script:
    """
    echo $x
    """
}

workflow {
    Channel.fromPath('./input/*.fq').set { fq_ch }
    getFastQ(fq_ch)
}