import 'package:flutter/material.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:walczak/common/constans/app_images.dart';
import 'package:walczak/common/widgets/app_background.dart';
import 'package:walczak/common/widgets/app_footer.dart';
import 'package:walczak/provider/video/video_state_provider.dart';
import 'package:walczak/screens/auth/auth_screen.dart';
import 'package:walczak/util/hooks/setup_state_hooks.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(() => const SplashScreen());

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = useScopedNavigator();
    final videoState = useProvided<VideoState>();

    useAsyncEffectAfterSetup(() async {
      if (videoState.isInitialized) {
        navigator.pushReplacementNamed(AuthScreen.route);
      } else {
        return;
      }
    }, [videoState.isInitialized]);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                AppImages.logo,
                width: 66,
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
