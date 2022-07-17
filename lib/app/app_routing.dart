import 'package:utopia_arch/utopia_arch.dart';
import 'package:walczak/screens/auth/auth_screen.dart';
import 'package:walczak/screens/intro/intro_screen.dart';
import 'package:walczak/screens/main/main_screen.dart';
import 'package:walczak/screens/splash/splash_screen.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,
    AuthScreen.route: AuthScreen.routeConfig,
    IntroScreen.route: IntroScreen.routeConfig,
    MainScreen.route: MainScreen.routeConfig,
  };

  static const initialRoute = SplashScreen.route;
}
