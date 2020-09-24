part of flame_extend;

mixin Box2dBodyHelper on BodyComponent {
  BodyDef createBodyDef();

  FixtureDef createFixtureDef();

  Shape createShape();

  double screenToWold(double src) {
    return src / viewport.scale;
  }

  Position getBodyPosition() {
    return Position.fromVector(viewport.getWorldToScreen(body.position));
  }

  @override
  @mustCallSuper
  void onMount() {
    _createBody();
  }

  void _createBody() {
    final shape = createShape();
    final fixtureDef = createFixtureDef()
      ..shape = shape
      ..userData = this;
    final bodyDef = createBodyDef();
    body = world.createBody(bodyDef)
      ..createFixtureFromFixtureDef(fixtureDef)
      ..userData = this;
  }
}
