part of flame_extend;

mixin PositionMixin on Component {
  double x = 0.0, y = 0.0, angle = 0.0;
  double width = 0.0, height = 0.0;
  Anchor anchor = Anchor.topLeft;
  bool renderFlipX = false;
  bool renderFlipY = false;
  bool debugMode = false;

  Color get debugColor => const Color(0xFFFF00FF);

  Paint get _debugPaint => Paint()
    ..color = debugColor
    ..style = PaintingStyle.stroke;

  TextConfig get debugTextConfig => TextConfig(color: debugColor, fontSize: 12);

  Position toPosition() => Position(x, y);

  void setByPosition(Position position) {
    x = position.x;
    y = position.y;
  }

  Position toSize() => Position(width, height);

  void setBySize(Position size) {
    width = size.x;
    height = size.y;
  }

  @override
  void render(Canvas canvas) {
    if (debugMode) {
      super.render(canvas);
    }
  }

  Rect toRect() => Rect.fromLTWH(x - anchor.relativePosition.dx * width,
      y - anchor.relativePosition.dy * height, width, height);

  void setByRect(Rect rect) {
    x = rect.left + anchor.relativePosition.dx * rect.width;
    y = rect.top + anchor.relativePosition.dy * rect.height;
    width = rect.width;
    height = rect.height;
  }

  double angleBetween(PositionComponent c) {
    return (atan2(c.x - x, y - c.y) - pi / 2) % (2 * pi);
  }

  double distance(PositionComponent c) {
    return sqrt(pow(y - c.y, 2) + pow(x - c.x, 2));
  }

  void renderDebugMode(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0.0, 0.0, width, height), _debugPaint);
    debugTextConfig.render(
        canvas,
        '''x: ${x.toStringAsFixed(2)} y:${y.toStringAsFixed(2)}''',
        Position(-50, -15));

    final rect = toRect();
    final dx = rect.right;
    final dy = rect.bottom;
    debugTextConfig.render(
        canvas,
        '''x:${dx.toStringAsFixed(2)} y:${dy.toStringAsFixed(2)}''',
        Position(width - 50, height));
  }

  void prepareCanvas(Canvas canvas) {
    canvas.translate(x, y);
    canvas.rotate(angle);
    final dx = -anchor.relativePosition.dx * width;
    final dy = -anchor.relativePosition.dy * height;
    canvas.translate(dx, dy);

    // Handle inverted rendering by moving center and flipping.
    if (renderFlipX || renderFlipY) {
      canvas.translate(width / 2, height / 2);
      canvas.scale(renderFlipX ? -1.0 : 1.0, renderFlipY ? -1.0 : 1.0);
      canvas.translate(-width / 2, -height / 2);
    }

    if (debugMode) {
      renderDebugMode(canvas);
    }
  }
}
