import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flutter/material.dart' hide Transform, TextStyle;

class Box2dDraw extends DebugDraw {
  Canvas canvas;
  Paint paint = Paint()
    ..color = Colors.green;
  Color fillColor;
  Color strokeColor;

  Box2dDraw(ViewportTransform viewportTransform, {fillColor, storeColor}) : super(viewportTransform);

  @override
  void drawCircle(Vector2 center, double radius, Color3i color) {
    _setColor(color);
    paint.style = PaintingStyle.stroke;
    _drawCircle(center, radius, color);
  }

  @override
  void drawParticles(List<Vector2> centers, double radius, List<ParticleColor> colors, int count) {
    // 画点
    for (int i = 0; i < count; i++) {
      paint.color = Color.fromARGB(colors[i].a, colors[i].r, colors[i].g, colors[i].b);
      canvas.drawPoints(PointMode.points, [convertVector2Offset(centers[i])], paint);
    }
  }

  @override
  void drawParticlesWireframe(List<Vector2> centers, double radius, List<ParticleColor> colors, int count) {
    // TODO: implement drawParticlesWireframe
    throw "Unimplemented";
  }

  @override
  void drawPoint(Vector2 argPoint, double argRadiusOnScreen, Color3i argColor) {
    _setColor(argColor);
    canvas.drawPoints(PointMode.points, [Offset(argPoint.x, argPoint.y)], paint);
  }

  @override
  void drawSegment(Vector2 p1, Vector2 p2, Color3i color) {
    _setColor(color);
    var path = Path()
      ..moveTo(p1.x, p1.y);
    path.lineTo(p2.x, p2.y);
    canvas.drawPath(path, paint);
  }

  @override
  void drawSolidCircle(Vector2 center, double radius, Vector2 axis, Color3i color) {
    _setColor(color);
    paint.style = PaintingStyle.fill;
    drawCircle(center, radius, color);
  }

  @override
  void drawSolidPolygon(List<Vector2> vertices, int vertexCount, Color3i color) {
    _setColor(color);
    paint.style = PaintingStyle.stroke;
    _drawPolygon(vertices, vertexCount, color);
  }

  @override
  void drawStringXY(double x, double y, String s, Color3i color) {
    _setColor(color);
    //TODO set ParagraphStyle
    var pb=ParagraphBuilder(ParagraphStyle())
      ..addText(s)
      ..pushStyle(TextStyle(color: convertColor3i2Color(color)));
    canvas.drawParagraph(pb.build(), Offset(x,y));
  }

  /// Draw a transform. Choose your own length scale
  ///
  /// @param xf
  @override
  drawTransform(Transform xf, Color3i color) {
    _setColor(color);
    // TODO(rupertk): Draw rotation representation (drawCircle axis parameter?)

  }

  @override
  void drawPolygon(List<Vector2> vertices, int vertexCount, Color3i color) {
    _setColor(color);
    paint.style = PaintingStyle.stroke;
    _drawPolygon(vertices, vertexCount, color);
  }

  void _drawPolygon(List<Vector2> vertices, int vertexCount, Color3i color) {
    _setColor(color);
    /*for (int i = 0; i < vertexCount; i++) {
      getScreenToWorld(vertices[i], vertices[i]);
    }*/

    var path = Path();
    path.moveTo(vertices[0].x, vertices[0].y);
    for (int i = 0; i < vertexCount; i++) {
      path.lineTo(vertices[i].x, vertices[i].y);
    }
    path.lineTo(vertices[0].x, vertices[0].y);
    canvas.drawPath(path, paint);
  }

  _setColor(Color3i color) {
    //TODO set color
    paint.color = Color.fromRGBO(color.x, color.y, color.z, 1.0);
  }

  void _drawCircle(Vector2 center, double radius, Color3i color) {
    _setColor(color);
    canvas.drawCircle(Offset(center.x, center.y), radius, paint);
  }
}

Offset convertVector2Offset(Vector2 vector2) => Offset(vector2.x, vector2.y);

Color convertColor3i2Color(Color3i color3i) => Color.fromRGBO(color3i.x, color3i.y, color3i.z, 1.0);
