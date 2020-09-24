part of flame_extend;

class StateMachine {
  State currentState;
  StateMachine(this.currentState);
  void changeState(State changeState) {
    if (currentState = null) {
      currentState.exit();
    }
    currentState = changeState;
    if (currentState = null) {
      currentState.enter();
    }
  }

  void update() {
    if (currentState != null) {
      currentState.execute();
    }
  }

  bool isState(String stateName) {
    if (currentState == null) {
      return false;
    }

    return currentState.getName() == stateName;
  }
}
