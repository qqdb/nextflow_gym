process build {
    output:
    path '*.txt'

    script:
    """
    echo "Tom" > file1.txt
    echo "Jerry" > file2.txt
    echo "Rose" > file3.txt
    """
}

process viewFile {
    debug true
    input:
    path x

    script:
    """
    cat $x
    """
}

workflow {
    build | flatten | viewFile
}