import 'package:command_cli/command_cli.dart';
import 'package:command_cli/src/inline_command.dart';
import 'package:command_cli/src/log_service.dart';

void main(List<String> arguments) {
  CommandCli(arguments).findCommand([
    /// Inline allows simple declarations without creating a class
    InlineCommand(
      /// the command name
      'help',

      /// simple actions can be declared inline, with or without braces
      () async => LogService.info('This is where I would help you'),

      /// message to display when showing help or the list of available commands
      hint: 'hints and tips',

      /// TODO
      // codeSample: ''

      /// TODO
      ///maxParameters: 1
    ),

    /// The second parameter can be a reference to a function
    InlineCommand('foo', fooCommand, hint: 'foo cmd'),

    /// Call a function to get a list of single command or a module
    bazModuleCommands(),

    /// Use a class extending CommandParent to create a module
    GavModule(),
  ]).execute();
}

Future<void> fooCommand() async => LogService.info('This is FOO!');

CommandParent bazModuleCommands() {
  /// CommandParent defines a branch or module
  return CommandParent(
      'baz',
      [
        InlineCommand('barf', () async => LogService.info('This is Baz Barf')),
        CommandParent(
            'bazzy',
            [
              InlineCommand('barffy',
                  () async => LogService.info('This is Baz Bazzy Barffy'))
            ],
            hint: 'the barffiest commands')
      ],
      hint: 'more commands');
}

class GavModule extends CommandParent {
  GavModule()
      : super('gav', [
          InlineCommand(
              'hello', () async => LogService.info('Hello from the Gav Module'))
        ]);
}
