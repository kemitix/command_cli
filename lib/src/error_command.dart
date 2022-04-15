import 'command.dart';
import 'log_service.dart';

/// Simple error handler - displays the error
class ErrorCommand extends Command {
  @override
  String get commandName => 'onerror';
  String error;
  ErrorCommand(this.error);
  @override
  Future<void> execute() async {
    LogService.error(error);
    LogService.info('run with `help` to help', false, false);
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
  get alias => const [];

  @override
  get children => const [];
}
