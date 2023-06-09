process task {
    debug true
    output:
    val true

    script:
    '''
    echo task
    '''

}

process task2 {
    debug true
    input:
    val ready
    path fq

    script:
    '''
    echo task2
    '''
}

workflow {
    Channel
        .fromPath('../input/*.fq')
        .set { reads_ch }
        

    task()
    task2(task.out, reads_ch)
}