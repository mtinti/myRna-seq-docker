# RNA-seq Docker Container

This repository contains the Dockerfile for `mtinti/rna_seq`, a comprehensive Docker container for RNA-seq data analysis that powers the [myRNA-seq Snakemake pipeline](https://github.com/mtinti/myRna-seq).

## Overview

The `mtinti/rna_seq` container bundles essential tools for RNA-seq analysis into a single, ready-to-use environment. This container eliminates the need to install and configure multiple bioinformatics tools individually, providing a consistent and reproducible environment for RNA-seq data processing.

## Included Tools

The container includes the following bioinformatics utilities:

- **fastp**: Fast all-in-one preprocessing for FASTQ files
- **bowtie2**: Fast and sensitive read alignment
- **samtools**: Utilities for manipulating alignments in SAM/BAM format
- **Picard**: Tools for manipulating high-throughput sequencing data
- **Qualimap**: Quality control of alignment sequencing data
- **featureCounts**: Read count quantification for RNA-seq
- **MultiQC**: Aggregate analysis reports across many samples
- **pysam**: Python interface for reading, manipulating, and writing SAM/BAM/CRAM files
- **Biopython**: Python toolkit for computational molecular biology and bioinformatics

## Usage

### Pull from Docker Hub

```bash
docker pull mtinti/rna_seq:latest
```

### Create a Singularity/Apptainer Image

For HPC environments using Singularity/Apptainer:

```bash
singularity pull rna_seq.sif docker://mtinti/rna_seq:latest
```

### Use with myRNA-seq Pipeline

This container is designed to work seamlessly with the [myRNA-seq Snakemake pipeline](https://github.com/mtinti/myRna-seq):

```bash
# Clone the pipeline repository
git clone https://github.com/mtinti/myRna-seq.git
cd myRna-seq

# Run the pipeline with the container
snakemake --use-singularity \
  --config singularity_image=/path/to/rna_seq.sif \
  --cores 8
```

## Building the Container

To build the container from this repository:

```bash
git clone https://github.com/mtinti/rnaseq_docker.git
cd rnaseq_docker
docker build -t mtinti/rna_seq:latest .
```

## Maintainer workflow: build and push a new Docker Hub version

Use these steps when publishing a new image version.

```bash
# 1) Choose a version tag
export VERSION=v1.0.0

# 2) Build the image with a version tag and latest
docker build -t mtinti/rna_seq:${VERSION} -t mtinti/rna_seq:latest .

# 3) Log in to Docker Hub
docker login

# 4) Push both tags
docker push mtinti/rna_seq:${VERSION}
docker push mtinti/rna_seq:latest

# 5) (Optional) Verify tags locally
docker images | grep mtinti/rna_seq
```

Suggested release practice:
- Use semantic version tags (`vMAJOR.MINOR.PATCH`) for traceability.
- Push `latest` only after validating the tagged image.
- Keep this README and Docker Hub description aligned.
