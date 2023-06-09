process build {
    debug true

    input:
    tuple val(sampleGroup), file(sampleFiles)

    script:
    """
    echo "$sampleGroup, $sampleFiles"
    """
}


workflow {
    Channel
        .fromPath('../input/*.fq')
        .map {
            file -> 
            def key = file.name.toString().split("_")[1]
            return tuple(key, file)
        }
        .groupTuple()
        .set { fq_ch }
    
    build(fq_ch)
}