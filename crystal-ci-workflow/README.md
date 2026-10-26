# Reading Report

A small Crystal project used to demonstrate a complete quality and release pipeline.

## Local verification

```sh
crystal tool format
crystal tool format --check
shards install
bin/ameba
crystal spec
```

## Release artifact

Build and execute the Linux artifact with:

```sh
crystal build --release --no-debug src/main.cr -o bin/reading-report
./bin/reading-report
```

Expected output:

```text
Crystal in Practice: 40.0% complete
```

The binary is built for the platform and architecture of the build machine. Distribute it with these run instructions and platform assumptions.
