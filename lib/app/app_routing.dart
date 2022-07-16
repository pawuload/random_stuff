import 'package:utopia_arch/utopia_arch.dart';
import 'package:walczak/screens/auth/auth_screen.dart';
import 'package:walczak/screens/splash/splash_screen.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,
    AuthScreen.route: AuthScreen.routeConfig,
  };

  static const initialRoute = SplashScreen.route;
}
