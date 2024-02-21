
# Workflow-1-Exercise
# Yeojin Kim

A Read Sequence Cleaning & Genome Assembly pipeline using Nextflow

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Get Started

Conda environment with fastp and spades

```sh
conda create -n nextflow -c bioconda fastp spades nextflow -y
```

Add .fastq.gz file in ./raw_data folder 

```sh
nextflow main.nf --read1 raw_data/F0582884_R1.fastq.gz --read2 raw_data/F0582884_R2.fastq.gz
```



