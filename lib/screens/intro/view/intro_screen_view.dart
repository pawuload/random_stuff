import 'package:flutter/material.dart';
import 'package:walczak/common/widgets/app_background.dart';
import 'package:walczak/screens/intro/state/intro_screen_state.dart';
import 'package:walczak/screens/intro/widget/intro_screen_video_player.dart';

class IntroScreenView extends StatelessWidget {
  final IntroScreenState state;
  const IntroScreenView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO add video from assets
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: IntroScreenVideoPlayer(state: state),
      ),
    );
  }
}
