part of flame_extend;

/// 装饰结点
/// 装饰：
abstract class IDecorator extends IBehaviour {}

abstract class BaseDecorator extends BaseBehavior implements IDecorator {
  IBehaviour child; //装饰器只会有一个子节点

  @override
  void addChild(IBehaviour child) {
    this.child = child;
  }
}
