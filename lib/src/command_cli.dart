import 'command.dart';
import 'command_parent.dart';
import 'error_command.dart';
import 'help_command.dart';

class CommandCli {
  CommandCli(this._arguments) {
    _instance = this;
  }

  final List<String> _arguments;

  static CommandCli? _instance;
  static CommandCli? get to => _instance;

  static List<String> get arguments => to!._arguments;

  Command findCommand(List<Command> commands) => _findCommand(0, commands);

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
      return HelpCommand(commands);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
