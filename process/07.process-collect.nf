process unzip {
    input:
    path file

    output:
    path 'file.fq'

    script:
    """
    cat $file > file.fq
    """
}

process viewFile {
    debug true
    
    input:
    path '*.fq'

    """
    cat *.fq | head -n 50
    """
}

workflow {
    Channel.fromPath("../input/*.fq", checkIfExists: true) \
    | unzip \
    | collect \
    | viewFile
}