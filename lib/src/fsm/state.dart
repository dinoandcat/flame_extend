part of flame_extend;
abstract class State<T> {
  T owner;
  State(this.owner);

  void enter();
  void execute();
  void exit();
  String getName();
}