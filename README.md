# Docker container for NCBI SRA Toolkit

See [github.com/ncbi/sra-tools/wiki](https://github.com/ncbi/sra-tools/wiki/) for more details.

**Note: For the version 2.10.7 and newer, users need to configure the tool interactively to run the tool, which means you cannot run the tool fully automatically, or in the distributed computing environment like HPC or Cloud instances. To use v2.10.x in the container-native manner, consider using the [official docker image](https://hub.docker.com/r/ncbi/sra-tools), which has pre-configured version.**

So you need to do interactively:

```
$ docker run --rm -v "$(pwd)":/data -w /data quay.io/inutano/sra-toolkit:v2.10.7 bash
root@XXXXXXXXXXXX:/work# vdb-config -i
// press x to quit and save the configuration
root@XXXXXXXXXXXX:/work# prefetch DRR000001
root@XXXXXXXXXXXX:/work# ls
DRR000001.sra
root@XXXXXXXXXXXX:/work# fasterq-dump --threads 16 DRR000001
DRR000001.sra	DRR000001.sra_1.fastq	DRR000001.sra_2.fastq
```

But it supposed to run like this:

```
$ ls
DRR000001.sra
$ docker run --rm -v "$(pwd)":/data -w /data quay.io/inutano/sra-toolkit:v2.10.7 fasterq-dump /data/DRR000001.sra
```

Let's wait for the sratoolkit team to upgrade the tool as it should be.  
For the time being, if you need to run in a smoother way, use older version:

```
$ docker run --rm -v "$(pwd)":/data -w /data quay.io/inutano/sra-toolkit:v2.9.2 fasterq-dump /data/DRR000001.sra
```
