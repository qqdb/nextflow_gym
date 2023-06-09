process task {
    output:
    path 'output.txt', optional: true

    script:
    """
    touch output.txt
    """
}

workflow {
    task()
}