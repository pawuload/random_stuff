import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:utopia_utils/utopia_utils.dart';
import 'package:walczak/app/app_injector.dart';
import 'package:walczak/app/app_reporter.dart';
import 'package:walczak/app/app_routing.dart';
import 'package:walczak/provider/setup/setup_state_provider.dart';

final injector = Injector.appInstance;

class App extends HookWidget {
  const App({Key? key}) : super(key: key);

  static void run() {
    UtopiaHooks.reporter = appReporter;
    runAppWithReporter(appReporter, const App());
  }

  @override
  Widget build(BuildContext context) {
    final navigatorKey = useMemoized(() => GlobalKey<NavigatorState>());
    return MultiProvider(
      providers: [
        Provider<ScopedNavigatorState>.value(value: ScopedNavigatorState(navigatorKey: navigatorKey)),
        InjectorProvider(setupInjector: () => AppInjector.setup()),
        const SetupStateProvider(),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        navigatorKey: navigatorKey,
        onGenerateInitialRoutes: (name) => [RouteConfig.generateInitialRoute(AppRouting.routes, name)],
        onGenerateRoute: (settings) => RouteConfig.generateRoute(AppRouting.routes, settings),
        navigatorObservers: [RouteConfig.createNavigationObserver(AppRouting.routes)],
        initialRoute: AppRouting.initialRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
