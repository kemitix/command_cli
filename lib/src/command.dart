abstract class Command {
  get commandName;

  get alias;

  get children;

  bool validate();

  Future<void> execute();
}
