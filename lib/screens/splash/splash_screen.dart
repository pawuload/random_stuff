import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:walczak/common/constans/app_color.dart';

class SplashScreen extends HookWidget {
  static const route = '/splash';
  static final routeConfig = RouteConfig.material(() => const SplashScreen());

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = useScopedNavigator();

    // useAsyncEffectAfterSetup(() async {}, []);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.background,
        child: Stack(
          children: [
            Center(
              child: Container( //TODO change Container to logo
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: _buildText(),
              ),
            ),
          ],
        ),
      ),
    );
    // return AuthScreenView();
  }

  Widget _buildText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'powered by ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Axiforma-ThinItalic',
          ),
        ),
        Text(
          'utopia.',
          style: GoogleFonts.ubuntu(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
