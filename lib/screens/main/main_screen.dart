import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:walczak/screens/main/state/main_screen_state.dart';
import 'package:walczak/screens/main/view/main_screen_view.dart';

class MainScreen extends HookWidget {
  static const route = '/main';
  static final routeConfig = RouteConfig.material(
    () => const MainScreen(),
    orientation: RouteConfigOrientation.portrait,
  );

  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = useMainScreenState();

    return MainScreenView(state: state);
  }
}
