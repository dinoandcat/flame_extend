part of flame_extend;

class BehaviorTree {
  IBehaviour _root;

  BehaviorTree(IBehaviour root) {
    _root = root;
  }

  void tick() {
    _root.tick();
  }

  bool haveRoot() {
    return _root != null ? true : false;
  }

  void setRoot(IBehaviour inNode) {
    _root = inNode;
  }

  void release() {
    _root.release();
  }
}
