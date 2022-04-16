**DEPRECATED** Library for creating cli tools that parses commands from arguments

> This library is deprecated in favour of using the `CommandRunner` from the [args](https://pub.dev/packages/args) package.

> While researching for existing libraries that provided this functionality, I missed `CommandRunner` when looking
at `args` as there was no reference to it until about halfway down the page. And, yes, it was the day after I published this, my first dart package, that I discovered `CommandRunner`.

Library for creating cli tools that parses commands from arguments

https://github.com/kemitix/command_cli

Most of the code is extracted and adapted from the [GetCLI v1.7.1](https://pub.dev/packages/get_cli) project.

# Example

```bash
$ dart run example/main.dart

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
$ dart run example/main.dart foo

This is FOO!
```

```bash
$ dart run example/main.dart baz

List of available commands:

  barf:
  bazzy:  the barffiest commands
    barffy:

```

```bash
$ dart run example/main.dart baz bazzy barffy

This is Baz Bazzy Barffy
```
