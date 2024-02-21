#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.reads1 = 'raw_data/F0582884_R1.fastq.gz'
params.reads2 = 'raw_data/F0582884_R2.fastq.gz'

process trim {
    input:
    file reads1
    file reads2

    output:

    path "r1_trimmed.fq.gz", emit: r1
    path "r2_trimmed.fq.gz", emit: r2

    script:
    """
    fastp -i ${reads1} -I ${reads2} -o r1_trimmed.fq.gz -O r2_trimmed.fq.gz  
    """
}

process skesa {
    input:
    path reads1
    path reads2

    script:
    """
    skesa --reads ${reads1} ${reads2} --contigs_out skesa_assembly.fna 1> skesa.stdout.txt 2> skesa.stderr.txt
    """
    }

workflow {
    reads1_ch = file(params.reads1)
    reads2_ch = file(params.reads2)

    main: 
    trim(reads1_ch, reads2_ch)
    skesa(trim.out.r1, trim.out.r2)
}
