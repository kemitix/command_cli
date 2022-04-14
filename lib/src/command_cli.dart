import 'command.dart';
import 'command_parent.dart';
import 'error_command.dart';
import 'help_command.dart';

class CommandCli {
  final List<String> _arguments;
  final List<Command> _commands;

  CommandCli(this._arguments, this._commands) {
    _instance = this;
  }

  static CommandCli? _instance;
  static CommandCli? get to => _instance;

  static List<String> get arguments => to!._arguments;

  Command findCommand() => _findCommand(0, _commands);

  Command _findCommand(int currentIndex, List<Command> commands) {
    try {
      final currentArgument = arguments[currentIndex].split(':').first;

      var command = commands.firstWhere(
          (command) =>
              command.commandName == currentArgument ||
              command.alias.contains(currentArgument),
          orElse: () => ErrorCommand('command not found'));
      if (command.children.isNotEmpty) {
        if (command is CommandParent) {
          command = _findCommand(++currentIndex, command.children);
        } else {
          var childrenCommand = _findCommand(++currentIndex, command.children);
          if (childrenCommand is! ErrorCommand) {
            command = childrenCommand;
          }
        }
      }
      return command;
      // ignore: avoid_catching_errors
    } on RangeError catch (_) {
      return HelpCommand();
    } on Exception catch (_) {
      rethrow;
    }
  }
}
