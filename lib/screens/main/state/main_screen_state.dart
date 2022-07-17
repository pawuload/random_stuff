import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:video_player/video_player.dart';
import 'package:walczak/common/widgets/video_player/video_controller_state.dart';
import 'package:walczak/models/video.dart';
import 'package:walczak/provider/video/video_state_provider.dart';

class MainScreenState {
  final List<Video> videos;
  final Video? videoSelected;
  final bool isVideoSelected;
  final VideoPlayerController? controller;
  final Function(Video) onVideoPressed;
  final Function() onBackPressed;

  const MainScreenState({
    required this.videoSelected,
    required this.isVideoSelected,
    required this.controller,
    required this.onVideoPressed,
    required this.videos,
    required this.onBackPressed,
  });
}

MainScreenState useMainScreenState() {
  final videoSelectedState = useState<Video?>(null);
  final isVideoFinishedState = useState<bool>(false);
  final isPlayingState = useState<bool>(false);
  final videoState = useProvided<VideoState>();
  final videoList = videoState.videos;

  final controller = useVideoControllerState(
    isSound: true,
    isPlaying: true,
    path: videoSelectedState.value?.videoUrl,
  );

  useEffect(() {
    if (controller != null) {
      checkIsFinished() {
        isVideoFinishedState.value =
            controller.value.isInitialized && controller.value.position == controller.value.duration;
      }

      controller.addListener(() {
        checkIsFinished();
      });
      return () {
        controller.removeListener(() {
          checkIsFinished();
        });
      };
    }
  }, [controller]);

  useSimpleEffect(() {
    if (isVideoFinishedState.value == true) {
      final index = videoSelectedState.value!.index + 1;
      videoSelectedState.value = videoList![index > videoList.length - 1 ? 0 : index];
    }
    isPlayingState.value = false;
  }, [isVideoFinishedState.value]);

  return MainScreenState(
    videoSelected: videoSelectedState.value,
    isVideoSelected: videoSelectedState.value != null,
    controller: controller,
    onVideoPressed: (video) => videoSelectedState.value = video,
    videos: videoList!,
    onBackPressed: () => videoSelectedState.value = null,
  );
}