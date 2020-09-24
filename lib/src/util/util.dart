part of flame_extend;

class Util {
  /// help init fullScreen,orientation...
  ///
  /// [fullScreen] Sets the app to be fullscreen(default true)
  /// [orientation] Sets the preferred orientation (landscape or portrait) for the app. When this is set,the orientations will not be used.
  /// [orientations] Sets the preferred orientations (landscape left, right, portrait up, or down) for the app.
  static Future<void> init({
    AssetBundle bundle,
    bool fullScreen = true,
    DeviceOrientation orientation,
    List<DeviceOrientation> orientations,
  }) async {
    await Flame.init(
        bundle: bundle, fullScreen: fullScreen, orientation: orientation);
    if (orientation == null && orientations != null) {
      await Flame.util.setOrientations(orientations);
    }
  }

  static List<DeviceOrientation> landscape() => <DeviceOrientation>[
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];

  static List<DeviceOrientation> portrait() => <DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ];

  /// select middle value
  ///
  /// [min] the min value
  /// [max]  the max value
  /// [select] the value need judge
  static num selectMiddleValue(num min, max, select) {
    select = select > min ? select : min;
    select = select < max ? select : max;
    return select;
  }

  /// convert joystick directional to vector
  ///
  ///enum JoystickMoveDirectional {
  ///   MOVE_UP,
  ///   MOVE_UP_LEFT,
  ///   MOVE_UP_RIGHT,
  ///  MOVE_RIGHT,
  ///   MOVE_DOWN,
  ///   MOVE_DOWN_RIGHT,
  ///   MOVE_DOWN_LEFT,
  ///   MOVE_LEFT,
  ///   IDLE
  /// }
  static Vector2 joystickDirectionalToVector(
      JoystickMoveDirectional directional) {
    switch (directional) {
      case JoystickMoveDirectional.MOVE_UP:
        return Vector2(0, -1).normalized();
        break;
      case JoystickMoveDirectional.MOVE_UP_LEFT:
        return Vector2(-1, -1).normalized();
        break;
      case JoystickMoveDirectional.MOVE_UP_RIGHT:
        return Vector2(1, -1).normalized();
        break;
      case JoystickMoveDirectional.MOVE_RIGHT:
        return Vector2(1, 0).normalized();
        break;
      case JoystickMoveDirectional.MOVE_DOWN:
        return Vector2(0, 1).normalized();
        break;
      case JoystickMoveDirectional.MOVE_DOWN_RIGHT:
        return Vector2(1, 1).normalized();
        break;
      case JoystickMoveDirectional.MOVE_DOWN_LEFT:
        return Vector2(-1, 1).normalized();
        break;
      case JoystickMoveDirectional.MOVE_LEFT:
        return Vector2(-1, 0).normalized();
        break;
      case JoystickMoveDirectional.IDLE:
        return Vector2.zero();
      default:
        throw UnsupportedError("unknown directional: $directional");
    }
  }
}
