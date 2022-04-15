# command_cli

Library for creating cli tools that parses commands from arguments

https://github.com/kemitix/command_cli

Most of the code is extracted and adapted from the [GetCLI v1.7.1](https://pub.dev/packages/get_cli) project.

# Example

Run the demo:

```bash
$ dart run example/demo.dart

List of available commands:

  bar:  bar cmd
  baz:  more commands
    barf:
    bazzy:  the barffiest commands
      barffy:
  foo:  foo cmd
  help:  hints and tips
```

```bash
$ dart run example/demo.dart foo

This is FOO!
```

```bash
$ dart run example/demo.dart baz

List of available commands:

  barf:
  bazzy:  the barffiest commands
    barffy:

```

```bash
$ dart run example/demo.dart baz bazzy barffy

This is Baz Bazzy Barffy
```
