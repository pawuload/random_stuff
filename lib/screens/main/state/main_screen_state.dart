import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:video_player/video_player.dart';
import 'package:walczak/models/video.dart';
import 'package:walczak/provider/video/video_state_provider.dart';

class MainScreenState {
  final List<Video> videos;
  final Video? videoSelected;
  final bool isVideoSelected;
  final VideoPlayerController controller;
  final Function(Video) onVideoPressed;
  final bool isInitialized;

  const MainScreenState({
    required this.videoSelected,
    required this.isVideoSelected,
    required this.isInitialized,
    required this.controller,
    required this.onVideoPressed,
    required this.videos,
  });
}

MainScreenState useMainScreenState() {
  final videoSelectedState = useState<Video?>(null);
  final isVideoFinishedState = useState<bool>(false);
  final isInitializedState = useState<bool>(false);
  final videoState = useProvided<VideoState>();
  final videoList = videoState.videos; //TODO from firebase

  final controller = useMemoized(
    () => VideoPlayerController.network(videoSelectedState.value?.videoUrl ?? '')
      ..initialize()
      ..play(),
    [videoSelectedState.value],
  );

  useEffect(() {
    checkIsFinished() {
      isVideoFinishedState.value =
          controller.value.isInitialized && controller.value.position == controller.value.duration;
    }

    checkIsInitialized() {
      isInitializedState.value = controller.value.isInitialized;
    }

    controller.addListener(() {
      checkIsInitialized();
      checkIsFinished();
    });
    return () {
      controller.removeListener(() {
        checkIsInitialized();
        checkIsFinished();
      });
    };
  }, [controller]);

  useSimpleEffect(() {
    if (isVideoFinishedState.value == true) {
      final index = videoSelectedState.value!.index + 1;
      videoSelectedState.value = videoList![index > videoList.length - 1 ? 0 : index];
      controller.play();
    }
  }, [isVideoFinishedState.value]);

  return MainScreenState(
    videoSelected: videoSelectedState.value,
    isVideoSelected: videoSelectedState.value != null,
    controller: controller,
    onVideoPressed: (video) => videoSelectedState.value = video,
    videos: videoList!,
    isInitialized: isInitializedState.value,
  );
}
