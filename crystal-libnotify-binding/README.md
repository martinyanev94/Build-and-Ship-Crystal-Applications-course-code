# Crystal libnotify binding

This demonstration wraps a minimal libnotify binding in `Transform::NotificationEmitter`.

## Native dependency

The program requires Crystal and the native `libnotify` library, including its development headers and linker metadata. The dependency is platform-specific; verify that libnotify is installed and available to the Crystal compiler before building.

## Run

From this directory, run the entry point with:

```text
crystal run src/main.cr
```

A successful run displays a desktop notification and prints `notification sent`. If initialization, notification creation, or display fails, the program writes a diagnostic to standard error and exits with status 1.
