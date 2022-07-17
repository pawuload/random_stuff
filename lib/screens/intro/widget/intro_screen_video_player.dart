import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:walczak/screens/intro/state/intro_screen_state.dart';
import 'package:walczak/screens/intro/widget/camera_screen_cover_fullscreen_wrapper.dart';

class IntroScreenVideoPlayer extends StatelessWidget {
  final IntroScreenState state;

  const IntroScreenVideoPlayer({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraScreenCoverFullscreenWrapper(
      aspectRatio: state.controller.value.aspectRatio,
      child: VideoPlayer(state.controller),
    );
  }
}
