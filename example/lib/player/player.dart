import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame_extend/flame_extend.dart';

class Player extends Component {
  StateMachine stateMachine;

  @override
  void render(Canvas c) {
    // TODO: implement render
  }

  @override
  void update(double t) {
    // TODO: implement update
    stateMachine.update();
  }
}
