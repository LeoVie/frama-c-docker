# Docker image for Frama-C

This is a docker image for [Frama-C](https://frama-c.com). The installation steps are taken from [this page](https://frama-c.com/install-20.0-Calcium.html).

## Usage

The Frama-C executable is executable via
```bash
docker run -ti -v ${PWD}:/src leovie/frama-c
```

### Example
Given you have two files `swap.c` and `swap.h`. Then you can analyse them via
```bash
docker run -ti -v ${PWD}:/src leovie/frama-c -wp swap.c swap.h -then -report
```