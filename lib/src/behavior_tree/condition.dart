part of flame_extend;

/// 条件基类
/// 具体执行动作
abstract class ICondition extends IBehaviour {
  bool isNegation();

  void setNegation(bool negation);
}

abstract class BaseCondition extends BaseBehavior implements ICondition {
  bool negation = false;

  @override
  bool isNegation() {
    return negation;
  }

  @override
  void setNegation(bool negation) {
    this.negation = negation;
  }

  int getRandom() {
    //    int i = random.intValue();
    return Random().nextInt(100);
  }
}
