# Counter

This directory contains examples that demonstrate how to prevent race conditions.

## guard_locks

This example demonstrates how to use guards and locks to prevent race conditions.

To compile and execute run:
```Shell
nim c --threads:on -r src/guard_locks.nim
```

## channel

This example demonstrates how to use a channel to send and receive data.

To compile and execute run:
```Shell
nim c --threads:on -r src/channel.nim
```
