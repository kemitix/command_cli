import 'package:command_cli/command_cli.dart';
import 'package:command_cli/src/inline_command.dart';
import 'package:command_cli/src/log_service.dart';

void main(List<String> arguments) {
  CommandCli(arguments).findCommand([
    InlineCommand(
        'help', () async => LogService.info('This is where I would help you'),
        hint: 'hints and tips'),
    InlineCommand('foo', fooCommand, hint: 'foo cmd'),
    InlineCommand('bar', () async => LogService.info('This is BAR!'),
        hint: 'bar cmd'),
    bazModuleCommands(),
  ]).execute();
}

CommandParent bazModuleCommands() {
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

Future<void> fooCommand() async => LogService.info('This is FOO!');
