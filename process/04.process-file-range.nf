process build {
    debug true

    input:
    tuple val(sampleId), file(indels), file(snps)

    """
    echo "$sampleId, $indels, $snps"
    """
}

workflow {
    Channel
        .from(1..23)
        .map {chr -> ["sample${chr}", file("../input/indels.${chr}.vcf"), file("../input/snps.${chr}.vcf")]}
        .set {input_ch}
    build(input_ch)
}