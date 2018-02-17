# Tweeter - a simple Twitter clone

This directory contains the simple Twitter clone - called Tweeter - that is created as part of Chapter 7 of the Nim in Action book.

## Compiling and Running

To setup the [SQLite](https://www.sqlite.org/index.html) database run:
```Shell
nimble c -r src/create_database.nim
```

To compile and execute the Tweeter application run:
```Shell
nimble c -r src/tweeter.nim
```

You can terminate the application by pressing Ctrl+C.
