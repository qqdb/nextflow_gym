process task {
    errorStrategy 'ignore'

    script:
    '''
    echo This is going to fail.
    exit 1
    '''
}

process task2 {
    script:
    '''
    echo successful
    '''
}

workflow {
    task()
    task2()
}