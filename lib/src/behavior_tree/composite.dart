part of flame_extend;

enum Policy {
  RequireOne,
  RequireAll,
}

/// 组合结点
abstract class IComposite extends IBehaviour {}

/// 并行节点
/// 并行器：多个行为并行执行
abstract class IParallel extends IComposite {}

/// 选择节点
/// 选择器:依次执行每个子节点直到其中一个执行成功或者返回Running状态
abstract class ISelector extends IComposite {}

/// 顺序节点
/// 顺序器：依次执行所有节点直到其中一个失败或者全部成功位置
abstract class ISequence extends IComposite {}

abstract class BaseComposite extends BaseBehavior implements IComposite {
  List<IBehaviour> children = [];

  @override
  void addChild(IBehaviour child) {
    children.add(child);
  }

  void removeChild(IBehaviour child) {
    children.remove(child);
  }

  void clearChild() {
    children.clear();
  }

  List<IBehaviour> getChildren() {
    return children;
  }

  void setChildren(List<IBehaviour> behaviours) {
    children = behaviours;
  }
}
