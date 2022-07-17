import 'package:cached_network_image/cached_network_image.dart';
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
    return Stack(
      children: [
        state.controller != null
            ? CameraScreenCoverFullscreenWrapper(
                aspectRatio: state.controller!.value.aspectRatio,
                child: VideoPlayer(state.controller!),
              )
            : Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: state.videoSelected!.thumbnail,
                  fit: BoxFit.fitHeight,
                ),
              ),
        _buildButton()
      ],
    );
  }

  Widget _buildButton() {
    return SafeArea(
      child: GestureDetector(
        onTap: state.onBackPressed,
        child: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Icon(
            Icons.close,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
