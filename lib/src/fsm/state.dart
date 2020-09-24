part of flame_extend;

mixin State<T> {
  T owner;
  void enter();
  void execute();
  void exit();
  String getName();
}
