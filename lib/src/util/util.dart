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
    await Flame.init(bundle: bundle, fullScreen: fullScreen, orientation: orientation);
    if (orientation == null && orientations != null) {
      await Flame.util.setOrientations(orientations);
    }
  }
}
