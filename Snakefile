configfile: "config.yaml"

rule all:
    input:
        expand("results/dada2/{sample}.rds", sample=config["samples"])

rule kneaddata:
    input:
        "data/raw/{sample}.fastq.gz"
    output:
        "results/kneaddata/{sample}_kneaddata.fastq.gz"
    threads: 4
    shell:
        (
            "kneaddata --input {input} --output results/kneaddata "
            "--threads {threads} --log results/kneaddata/{wildcards.sample}.log"
        )

rule dada2:
    input:
        "results/kneaddata/{sample}_kneaddata.fastq.gz"
    output:
        "results/dada2/{sample}.rds"
    shell:
        "Rscript scripts/run_dada2.R {input} {output}"
