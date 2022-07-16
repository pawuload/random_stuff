import 'package:flutter/material.dart';
import 'package:walczak/common/widgets/app_background.dart';
import 'package:walczak/common/widgets/app_footer.dart';

class AuthScreenView extends StatelessWidget {
  const AuthScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: Stack(
          children: [
            Center(
              //TODO change Container to captcha
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
