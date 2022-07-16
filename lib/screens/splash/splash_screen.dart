import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:walczak/common/constans/app_color.dart';
import 'package:walczak/common/widgets/app_footer.dart';
import 'package:walczak/screens/auth/auth_screen.dart';
import 'package:walczak/util/hooks/setup_state_hooks.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(() => const SplashScreen());

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = useScopedNavigator();

    useAsyncEffectAfterSetup(() async {
      navigator.pushReplacementNamed(AuthScreen.route);
    }, []);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.background,
        child: Stack(
          children: [
            Center(
              //TODO change Container to logo
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
