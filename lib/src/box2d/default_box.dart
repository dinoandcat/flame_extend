part of flame_extend;

class DefaultBox extends Box2DComponent {
  DefaultBox({
    Size dimensions,
    int worldPoolSize = Box2DComponent.DEFAULT_WORLD_POOL_SIZE,
    int worldPoolContainerSize =
        Box2DComponent.DEFAULT_WORLD_POOL_CONTAINER_SIZE,
    double gravity = Box2DComponent.DEFAULT_GRAVITY,
    int velocityIterations = Box2DComponent.DEFAULT_VELOCITY_ITERATIONS,
    int positionIterations = Box2DComponent.DEFAULT_POSITION_ITERATIONS,
    double scale = Box2DComponent.DEFAULT_SCALE,
  }) : super(
          dimensions: dimensions,
          worldPoolSize: worldPoolSize,
          worldPoolContainerSize: worldPoolContainerSize,
          gravity: gravity,
          velocityIterations: velocityIterations,
          positionIterations: positionIterations,
          scale: scale,
        );

  @override
  void initializeWorld() {}
  @override
  int priority() => PriorityLayer.GAME_INTERFACE;
}
