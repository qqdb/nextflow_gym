// params.data = "../input/*.fq"
params.data = ""

process loadData {
    debug true

    input:
    val x
    when:
    x != 'EMPTY'

    script:
    """
    echo $x
    """
}

workflow {
    reads_ch = params.data
    ? Channel.fromPath(params.data, checkIfExists:true)
    : Channel.empty()

  reads_ch \
    | ifEmpty { 'EMPTY' } \
    | loadData
}