
# Workflow-1-Exercise
# Yeojin Kim

A Read Sequence Cleaning & Genome Assembly pipeline using Nextflow

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

# Get Started

- Read Sequence Cleaning: fastp 
- Genome Assembly: skesa

Conda environment with fastp and skesa

```sh
conda create -n nextflow -c bioconda fastp spades nextflow -y
```

Add .fastq.gz file in ./raw_data folder 

```sh
nextflow main.nf --reads1 raw_data/F0582884_R1.fastq.gz --reads2 raw_data/F0582884_R2.fastq.gz
```



