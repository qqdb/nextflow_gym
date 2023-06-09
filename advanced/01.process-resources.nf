process mapping {
    debug true
    memory { reads.size() < 70.KB ? 1.GB : 5.GB }

    input:
    path reads

    """
    echo your_command_here --in ${reads} --mem=${task.memory.giga}
    """
}

workflow {
    Channel
        .fromPath("../input/*.fq")
        .set { reads_ch }

    mapping(reads_ch)
}