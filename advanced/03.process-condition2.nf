params.flag = false

process num {
    input:
    val x

    output:
    path 'x.txt'

    script:
    """
    echo $x > x.txt
    """
}

process str {
    input:
    val y

    output:
    path 'y.txt'

    script:
    """
    echo $y > y.txt
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
    (num_ch, str_ch) = params.flag
    ? [Channel.empty(), Channel.of(1..5)]
    : [Channel.of('A'..'E'), Channel.empty()]

    num(num_ch)
    str(str_ch)

    num.out | mix(str.out) | watch
}