import 'command.dart';

/// Base for defining a module, or branch of commands
class CommandParent extends Command {
  final String _name;
  final List<Command> _children;
  late List<String> _alias;
  late String _hint;
  CommandParent(
    this._name,
    this._children, {
    List<String> alias = const [],
    String hint = '',
  }) {
    _alias = alias;
    _hint = hint;
  }

  @override
  String get commandName => _name;
  @override
  List<Command> get children => _children;
  @override
  List<String> get alias => _alias;

  @override
  Future<void> execute() async {}

  @override
  String get hint => _hint;

  @override
  bool validate() => true;

  @override
  String get codeSample => '';

  @override
  int get maxParameters => 0;
}
