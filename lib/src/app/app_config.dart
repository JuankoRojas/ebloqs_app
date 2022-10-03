class AppConfig {
  Environment? environment;
  //SINGLETON

  AppConfig._internal();
  static final AppConfig _instance = AppConfig._internal();
  static AppConfig get instance => _instance;

  // factory AppConfig() {
  //   return _instance;
  // }
  void init({required Environment environment}) {
    this.environment = environment;
  }
}

enum Environment { dev, prod }
