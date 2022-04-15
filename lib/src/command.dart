import 'args_mixin.dart';
import 'cli_exception.dart';
import 'command_cli.dart';
import 'log_service.dart';

abstract class Command with ArgsMixin {
  Command() {
    while (
        ((args.contains(commandName) || args.contains('$commandName:$name'))) &&
            args.isNotEmpty) {
      args.removeAt(0);
    }
    if (args.isNotEmpty && args.first == name) {
      args.removeAt(0);
    }
  }
  int get maxParameters;

  //int get minParameters;

  String? get codeSample;
  String get commandName;

  List<String> get alias => [];

  List<String> get acceptedFlags => [];

  /// hint for command line
  String? get hint;

  /// validate command line arguments
  bool validate() {
    if (CommandCli.arguments.contains(commandName) ||
        CommandCli.arguments.contains('$commandName:$name')) {
      var flagsNotAccepted = flags;
      flagsNotAccepted
          .removeWhere((element) => acceptedFlags.contains(element));
      if (flagsNotAccepted.isNotEmpty) {
        LogService.info('Unnecessary flags: ' + flagsNotAccepted.toString());
      }

      if (args.length > maxParameters) {
        List pars = args.skip(maxParameters).toList();
        throw CliException('Unnecessary Parameters: ' + pars.toString(),
            codeSample: codeSample);
      }
    }
    return true;
  }

  /// execute command
  Future<void> execute();

  /// children command
  List<Command> get children => [];
}
