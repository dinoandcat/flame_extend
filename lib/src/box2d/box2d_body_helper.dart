part of flame_extend;

mixin Box2dBodyHelper on BodyComponent {
  Shape createShape();

  BodyDef createBodyDef();

  FixtureDef createFixtureDef();

  @override
  void onMount() {
    createBody();
  }

  void createBody() {
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
