# microbiome-pipeline

This repository contains a minimal Snakemake workflow that runs
[kneaddata](https://github.com/biobakery/kneaddata) followed by
[DADA2](https://benjjneb.github.io/dada2/) for microbiome data processing.

## Quick start

1. Create a conda environment with the required tools:

   ```bash
   conda env create -f environment.yaml
   conda activate microbiome-pipeline
   ```

2. Place your raw FASTQ files in `data/raw/` and list the sample names in
   `config.yaml`.

3. Execute the workflow:

   ```bash
   snakemake --cores 4
   ```

Outputs from kneaddata are written to `results/kneaddata/` and DADA2
results are saved as RDS files in `results/dada2/`.
