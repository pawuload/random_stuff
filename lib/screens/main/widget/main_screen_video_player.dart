import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:walczak/screens/intro/widget/camera_screen_cover_fullscreen_wrapper.dart';
import 'package:walczak/screens/main/state/main_screen_state.dart';

class MainScreenVideoPlayer extends StatelessWidget {
  final MainScreenState state;

  const MainScreenVideoPlayer({required this.state, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CameraScreenCoverFullscreenWrapper(
      aspectRatio: state.controller.value.aspectRatio,
      child: state.isInitialized
          ? VideoPlayer(state.controller)
          : Image.network(state.videoSelected!.thumbnail, fit: BoxFit.cover,),
    );
  }
}
