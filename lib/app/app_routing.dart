import 'package:utopia_arch/utopia_arch.dart';
import 'package:walczak/screens/splash/splash_screen.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,

  };

  static const initialRoute = SplashScreen.route;
}
