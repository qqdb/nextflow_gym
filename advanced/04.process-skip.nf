params.skip = true

process p1 {
    input: 
    path x

    script:
    """
    echo $x > x.txt
    """
}

process p2 {
    input:
    path x

    script:
    """
    echo $x > x.txt
    """
}

process watch {
    debug true
    input:
    path x

    script:
    """
    cat $x
    """
}

workflow {
    (fa_ch, fq_ch) = params.skip
    ? [Channel.fromPath("../input/*.fa"), Channel.empty()]
    : [Channel.empty(), Channel.fromPath("../input/*.fq")]

    fa_ch | mix(fq_ch) | watch
}