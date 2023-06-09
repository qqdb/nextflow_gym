process foo {
    input: path x
    script: 
    """
    echo $x
    """
}

process bar {
    input: path x
    script:
    """
    echo $x
    """
}

workflow {
    input_ch = Channel.fromPath("./input?sample**.fa")
    foo(input_ch)
    bar(input_ch)
}