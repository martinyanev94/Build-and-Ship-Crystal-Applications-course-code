# Crystal Production Distribution

This project builds a small reading report as a production Crystal binary.

## Build

```sh
crystal build src/main.cr --release --no-debug -o bin/reading-report
```

## Distribution

The release artifact is `bin/reading-report`.

### Compatibility

- Target platform: Linux x86_64
- Crystal installation: not required to run the binary

### Run the release

```sh
./bin/reading-report
```

### Verify the artifact

```sh
./bin/reading-report
ldd bin/reading-report
```

On macOS, inspect dependencies with `otool -L bin/reading-report`.

The binary is tied to the operating system and CPU architecture used to build it. Publish a separate binary for each supported target.
