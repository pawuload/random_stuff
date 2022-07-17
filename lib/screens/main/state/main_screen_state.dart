import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:video_player/video_player.dart';
import 'package:walczak/models/video.dart';

class MainScreenState {
  final Video? videoSelected;
  final bool isVideoSelected;
  final VideoPlayerController controller;
  final Function(Video) onVideoPressed;

  const MainScreenState({
    required this.videoSelected,
    required this.isVideoSelected,
    required this.controller,
    required this.onVideoPressed,
  });
}

MainScreenState useMainScreenState() {
  final videoSelectedState = useState<Video?>(null);
  final isVideoFinishedState = useState<bool>(false);

  final videoList = []; //TODO from firebase

  final controller = useMemoized(
    () => VideoPlayerController.network('url')
      ..initialize()
      ..play(),
    [videoSelectedState.value],
  );

  useEffect(() {
    checkIsFinished() {
      isVideoFinishedState.value =
          controller.value.isInitialized && controller.value.position == controller.value.duration;
    }

    controller.addListener(() => checkIsFinished());
    return () {
      controller.removeListener(() => checkIsFinished());
    };
  }, [controller]);

  useSimpleEffect(() {
    if (isVideoFinishedState.value == true) {
      videoSelectedState.value = videoList[videoSelectedState.value!.index + 1];
    }
  }, [isVideoFinishedState.value]);

  return MainScreenState(
    videoSelected: videoSelectedState.value,
    isVideoSelected: videoSelectedState.value != null,
    controller: controller,
    onVideoPressed: (video) => videoSelectedState.value = video,
  );
}
