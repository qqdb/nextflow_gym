process Task {
    debug true
    
    script:
    """
    echo Task Path: \$PWD
    """
}

process Task2 {
    debug true

    script:
    '''
    echo Task2 Path: $PWD
    '''
}

workflow {
    Task()
    Task2()
}