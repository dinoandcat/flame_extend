part of flame_extend;

class BehaviorTreeBuilder {
  //使用 List 当作一个栈使用
  List<IBehaviour> behaviourStack = [];
  IBehaviour treeRoot;

  BehaviorTreeBuilder addBehaviour(IBehaviour behaviour) {
    //      assert(NewBehavior);
    //如果没有根节点设置新节点为根节点
    //否则设置新节点为堆栈顶部节点的子节点
    if (treeRoot == null) {
      treeRoot = behaviour;
    } else {
      behaviourStack.last.addChild(behaviour);
    }

    //将新节点压入堆栈
    //    NodeStack.push(NewBehavior);
    behaviourStack.add(behaviour);
    return this;
  }

  BehaviorTreeBuilder back() {
    behaviourStack.removeLast();
    return this;
  }

  BehaviorTree end() {
    while (behaviourStack.isNotEmpty) {
      behaviourStack.removeLast();
    }
    BehaviorTree tmp = BehaviorTree(treeRoot);
    return tmp;
  }
}
