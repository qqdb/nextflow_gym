workflow {
    fq_ch = Channel.fromFilePairs('./input/*_{1,2}.fq')
    fq_ch.toSortedList( { a, b -> a[0] <=> b[0] } )
        .flatMap()
        .view()
}