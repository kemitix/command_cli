import 'command.dart';

class ErrorCommand extends Command {
  @override
  String get commandName => 'onerror';
  String error;
  ErrorCommand(this.error);
  @override
  Future<void> execute() async {
    //LogService.error(error);
    //LogService.info('run `get help` to help', false, false);
  }

  @override
  String get hint => 'Print on error';

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;

  @override
  bool validate() => true;

  @override
  // TODO: implement alias
  get alias => throw UnimplementedError();

  @override
  // TODO: implement children
  get children => throw UnimplementedError();
}
