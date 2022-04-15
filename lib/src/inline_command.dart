import 'command.dart';

class InlineCommand extends Command {
  late final String _commandName;
  String? _hint;
  late final int _maxParameters;
  String? _codeSample;
  late final Future<void> Function() _execute;

  InlineCommand(
    this._commandName,
    this._execute, {
    String hint = '',
    int? maxParameters,
    String? codeSample,
  }) {
    _hint = hint;
    _maxParameters = maxParameters ?? 0;
    _codeSample = codeSample;
  }

  @override
  String? get codeSample => _codeSample;

  @override
  String get commandName => _commandName;

  @override
  Future<void> execute() async => _execute();

  @override
  String? get hint => _hint;

  @override
  int get maxParameters => _maxParameters;
}
