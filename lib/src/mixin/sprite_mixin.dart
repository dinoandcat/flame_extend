part of flame_extend;

mixin SpriteMixin on PositionComponent {
  Sprite sprite;
  Paint overridePaint;

  @override
  void render(Canvas c) {
    sprite.render(c,
        width: width, height: height, overridePaint: overridePaint);
  }

  @override
  bool loaded() {
    return sprite != null && sprite.loaded() && x != null && y != null;
  }
}
