# Spawned Procedures

This directory contains two small examples for the behavior of spawn.

## reading

This application will wait until you press the enter key. It shows how to read input from the terminal with spawn.

To compile and execute the example run:
```Shell
nim c --threads:on -r src/reading.nim
```

## exception

This example demonstrates that when a spawned procedure crashes with an unhandled exception, the application will crash with it.

To compile and execute the example run:
```Shell
nim c --threads:on -r src/exception.nim
```
