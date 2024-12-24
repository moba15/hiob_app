abstract class BackgroundRunner {
  Future<void> init();

  Future<bool> shouldStart();

  Future<void> start();

  Future<void> stop();

  Future<void> logTalker(String msg);
}
