import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:walczak/models/video.dart';
import 'package:walczak/screens/main/state/main_screen_state.dart';

class MainScreenVideoCard extends StatelessWidget {
  final MainScreenState state;
  final Video video;

  const MainScreenVideoCard({Key? key, required this.state, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.grey[400],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              video.thumbnail,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return _buildShimmer();
              },
            ),
            _buildPlayButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayButton() {
    return const Center(
      child: Material(
        elevation: 1,
        color: Colors.transparent,
        shape: CircleBorder(side: BorderSide(color: Colors.white)),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: Container(
        color: Colors.grey[100],
      ),
    );
  }
}
