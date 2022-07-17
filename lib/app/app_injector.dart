import 'package:injector/injector.dart';
import 'package:walczak/service/video_service.dart';

class AppInjector {
  const AppInjector._();

  static Injector setup() {
    final injector = Injector();
    injector.registerSingleton(() => VideoService());
    return injector;
  }
}
