# Docker container for NCBI SRA Toolkit

See [github.com/ncbi/sra-tools/wiki](https://github.com/ncbi/sra-tools/wiki/) for more details.

**Note: For the version 2.10.7 and newer, users need to configure the tool interactively to run the tool, which means you cannot run the tool fully automatically, or in the distributed computing environment like HPC or Cloud instances. To use v2.10.x in the container-native manner, consider using the [official docker image](https://hub.docker.com/r/ncbi/sra-tools), which has pre-configured version.**

# sratools for non-root docker invokation

The entrypoint script `configure-and-run` will set working directory as `HOME` and create a user setting script in `$HOME/.ncbi`. So you can run like this:

```
$ ls
SRR1274306.sra
$ docker run --rm -v "$(pwd)":/data -w /data ghcr.io/inutano/sra-tools:<hash> fasterq-dump SRR1274306.sra
```

Note that it won't work if you run without specifying working directory in the container (the process will set `/` as working directory and cause permission error).
