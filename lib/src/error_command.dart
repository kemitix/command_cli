import 'package:command_dart/src/command.dart';

class ErrorCommand extends Command {
  final String _message;

  ErrorCommand(this._message);

  @override
  // TODO: implement alias
  get alias => throw UnimplementedError();

  @override
  // TODO: implement children
  get children => throw UnimplementedError();

  @override
  // TODO: implement commandName
  get commandName => throw UnimplementedError();

  @override
  Future<void> execute() {
    // TODO: implement execute
    throw UnimplementedError();
  }

  @override
  bool validate() {
    // TODO: implement validate
    throw UnimplementedError();
  }
}
