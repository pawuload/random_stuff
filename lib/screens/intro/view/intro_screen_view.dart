import 'package:flutter/material.dart';
import 'package:walczak/common/widgets/app_background.dart';

class IntroScreenView extends StatelessWidget {
  const IntroScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO add video from assets
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: const Center(
                  child: Text('INTRO'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
