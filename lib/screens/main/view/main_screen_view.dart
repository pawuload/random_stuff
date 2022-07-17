import 'package:flutter/material.dart';
import 'package:walczak/models/video.dart';
import 'package:walczak/screens/main/state/main_screen_state.dart';
import 'package:walczak/screens/main/widget/main_screen_video_card.dart';
import 'package:walczak/screens/main/widget/main_screen_video_player.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenState state;

  const MainScreenView({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black.withOpacity(0.95),
        child: state.isVideoSelected
            ? MainScreenVideoPlayer(state: state)
            : GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 350,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                children: [for (final video in state.videos) _buildVideo(video)],
              ),
      ),
    );
  }

  Widget _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => state.onVideoPressed(video),
      child: MainScreenVideoCard(
        state: state,
        video: video,
      ),
    );
  }
}
