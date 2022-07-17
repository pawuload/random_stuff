import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:video_player/video_player.dart';
import 'package:walczak/common/constans/app_video.dart';

class IntroScreenState {
  final VideoPlayerController controller;

  const IntroScreenState({required this.controller});
}

IntroScreenState useIntroScreenState({required Function() navigateToMain}) {
  final isVideoFinishedState = useState<bool>(false);
  final controller = useMemoized(
    () => VideoPlayerController.asset(AppVideo.intro)
      ..initialize()
      ..play(),
    [],
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
      navigateToMain();
    }
  }, [isVideoFinishedState.value]);

  return IntroScreenState(
    controller: controller,
  );
}
