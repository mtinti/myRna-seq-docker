FROM mambaorg/micromamba:2.0.8
# Set user to root for installation (needed to avoid permission issues)
USER root
# Set working directory
WORKDIR /app

# Create and activate the RNA-seq environment 
# Use proper channel priority to avoid conflicts
RUN micromamba install -y -n base -c conda-forge -c bioconda \
    bowtie2 \
    subread \
    samtools \
    fastp \
    fastqc \
    multiqc \
    rseqc \
    bcftools \
    deeptools \
    bedtools \
    picard \
    bwa-mem2 \
    sra-tools \
    fastq-screen \
    kraken \
    qualimap \
    minimap2 \
    snakemake && \
    micromamba clean --all --yes

# Create a symlink directory structure to ensure tools are in standard PATH
RUN mkdir -p /usr/local/bin && \
    ln -s /opt/conda/bin/* /usr/local/bin/

# Add labels for documentation
LABEL description="RNA-seq analysis container with bioinformatics tools"
LABEL maintainer="Your Name <your.email@example.com>"
LABEL tools="bowtie2, samtools, fastp, fastqc, snakemake and more"
LABEL usage="Designed for use with Snakemake and Singularity"

# Set bash shell as the default shell
SHELL ["/bin/bash", "-c"]

# For now, let's use a direct CMD without an ENTRYPOINT
CMD ["bash"]