import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';

import '../auth/view/auth_screen_view.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(() => const SplashScreen());

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = useScopedNavigator();

    // useAsyncEffectAfterSetup(() async {}, []);

    // return Scaffold(
    //   body: Container(
    //     width: double.infinity,
    //     height: double.infinity,
    //     color: AppColors.background,
    //     child: Stack(
    //       children: [
    //         Center(
    //TODO change Container to logo
    //           child: Container(
    //             width: 100,
    //             height: 100,
    //             color: Colors.white,
    //           ),
    //         ),
    //         const AppFooter(),
    //       ],
    //     ),
    //   ),
    // );
    return AuthScreenView();
  }
}
