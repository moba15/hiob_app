enum BackgroundRunnerStrategy { disabled, local }

extension BackgroundRunnerStrategyName on BackgroundRunnerStrategy {
  get name {
    switch (this) {
      case BackgroundRunnerStrategy.disabled:
        return "Off";
      case BackgroundRunnerStrategy.local:
        return "Local";
    }
  }
}

abstract class BackgroundRunner {
  Future<void> init();

  Future<bool> shouldStart();

  Future<void> start();

  Future<void> stop();

  Future<void> logTalker(String msg);
}
