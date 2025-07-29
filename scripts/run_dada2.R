#!/usr/bin/env Rscript
args <- commandArgs(trailingOnly=TRUE)
input_file <- args[1]
output_file <- args[2]

library(dada2)

# Simple DADA2 workflow for a single sample
filt <- tempfile(fileext=".fastq.gz")
filterAndTrim(input_file, filt, truncLen=240, maxN=0, maxEE=2, truncQ=2, rm.phix=TRUE, multithread=FALSE)
derep <- derepFastq(filt)
dd <- dada(derep, err=NULL, multithread=FALSE)
seqtab <- makeSequenceTable(dd)

saveRDS(seqtab, output_file)
