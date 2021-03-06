import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:walczak/screens/intro/state/intro_screen_state.dart';
import 'package:walczak/screens/intro/view/intro_screen_view.dart';
import 'package:walczak/screens/main/main_screen.dart';

class IntroScreen extends HookWidget {
  static const route = '/intro';
  static final routeConfig = RouteConfig.material(
    () => const IntroScreen(),
    orientation: RouteConfigOrientation.portrait,
  );

  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = useScopedNavigator();
    final state = useIntroScreenState(
      navigateToMain: () => navigator.pushReplacementNamed(MainScreen.route),
    );
    return IntroScreenView(
      state: state,
    );
  }
}
