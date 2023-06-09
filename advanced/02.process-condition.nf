params.flag = false

process cat {
    output:
    path "cat.txt"

    script:
    '''
    echo cat > cat.txt
    '''
}

process dog {
    output:
    path 'dog.txt'

    script:
    '''
    echo dog > dog.txt
    '''
}

process animal {
    debug true
    input:
    path x

    script:
    """
    cat $x
    """
    
}


workflow {
    // Method 1
    // if(params.flag){
    //     cat()
    //     animal_ch = cat.out
    // }else{
    //     dog()
    //     animal_ch = dog.out
    // }

    // animal(animal_ch)

    // Method 2
    (params.flag ? cat : dog) | animal
}