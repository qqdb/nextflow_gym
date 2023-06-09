process task {
    debug true
    input:
    val x

    script:
    """
    for INDEX in ${x.join(' ')};do
        echo "Task: \${INDEX}"
    done
    """
}

workflow {
    Channel
        .of(1..100)
        .buffer(size:10, remainder: true)
        .set{ val_ch }

    task(val_ch)
}