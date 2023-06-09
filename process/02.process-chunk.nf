params.infile = "/home/leizheng/workspace/nextflow_/input/genome.fa"
params.size = 5

process splitChunk {
    debug true
    input:
    path x

    script:
    """
    rev $x | rev
    """
}

workflow {
    Channel.from(params.infile) \
    | splitText(by: params.size) \
    | splitChunk
}