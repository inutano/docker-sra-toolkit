# Docker container for NCBI SRA Toolkit

See [github.com/ncbi/sra-tools/wiki](https://github.com/ncbi/sra-tools/wiki/) for more details.

**Note: For the version 2.10.7 and newer, users need to configure the tool interactively to run the tool, which means you cannot run the tool fully automatically, or in the distributed computing environment like HPC or Cloud instances. To use v2.10.x in the container-native manner, consider using the [official docker image](https://hub.docker.com/r/ncbi/sra-tools), which has pre-configured version.**

# NCBI SRA tools docker image for user privilege docker run (experimental)

The image `ghcr.io/inutano/sra-tools` is based on the [NCBI's official docker image](https://hub.docker.com/r/ncbi/sra-tools), but has a script called `configure-and-run` as its entrypoint which sets the working directory as `HOME` and create a user setting script in `$HOME/.ncbi`. This enables you to run like this:

```
$ ls
SRR1274306.sra
$ docker run --rm -v "$(pwd)":/data -w /data ghcr.io/inutano/sra-tools:<hash> fasterq-dump SRR1274306.sra
```

This works pretty fine with the cases such as a run via Common Workflow Language, or via Singularity. Note that it won't work if you run without specifying working directory in the container (the process will set `/` as working directory by default which causes permission error).
