import 'package:flutter/material.dart';
import 'package:walczak/common/widgets/app_background.dart';
import 'package:walczak/models/video.dart';
import 'package:walczak/screens/main/state/main_screen_state.dart';
import 'package:walczak/screens/main/widget/main_screen_video_player.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenState state;

  const MainScreenView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //TODO add video from assets
        width: double.infinity,
        height: double.infinity,
        decoration: appBackground(),
        child: state.isVideoSelected
            ? MainScreenVideoPlayer(state: state)
            : Column(
                children: [for (final video in state.videos) _buildVideo(video)],
              ),
      ),
    );
  }

  Widget _buildVideo(Video video) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
          onTap: () => state.onVideoPressed(video),
          child: Column(
            children: [
              Text(video.videoUrl),
              Text(video.thumbnail),
              Text(video.index.toString()),
            ],
          )),
    );
  }
}
