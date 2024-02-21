#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process trim {

    

  input:
    file reads
  
  output:
    file "${reads:0:8}_trimmed.fq.gz " 

  script:
  """
  fastp -i ${reads} -o ${reads:0:8}_trimmed.fq.gz  
  """
}

process spades {

  input:
    file reads
  output:
    path "output" 

  script:
  """
  spades.py --careful -s ${reads} -o output
  """
}

//Channel
     //reads_ch = Channel.fromPath("F0582884_R1.fastq")
// reads_ch = Channel.fromPath("F0582884_R1.fastq")
 // .fromPath("/home/harry/Comp_genomics/nextflow/F0582884_R1.fastq") 
//  .set { re

workflow {

reads_ch = file("F0582884_R1.fastq.gz")
//reads_ch = Channel.fromPath("F0582884_R1.fastq")

println reads_ch
  main: 
    trimmed_reads = trim(reads_ch)
    spades(trimmed_reads)

}
