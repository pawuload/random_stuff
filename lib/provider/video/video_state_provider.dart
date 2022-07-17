import 'package:flutter/cupertino.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_hooks/utopia_hooks.dart';
import 'package:walczak/models/video.dart';
import 'package:walczak/service/video_service.dart';

class VideoState {
  final List<Video>? Function() getVideos;
  final Future<List<Video>?> Function() refresh;

  VideoState({
    required this.getVideos,
    required this.refresh,
  });

  List<Video>? get videos => getVideos();

  bool get isInitialized => videos != null;
}

class VideoStateProvider extends HookStateProviderWidget<VideoState> {
  const VideoStateProvider({Key? key}) : super(key: key);

  @override
  VideoState use() {
    final videoService = useInjected<VideoService>();

    final computedState = useAutoComputedState(
      compute: () async => await videoService.getAllItems(),
      keys: [],
    );

    return useMemoized(() => VideoState(
          getVideos: () => computedState.valueOrPreviousOrNull,
          refresh: () async => await computedState.tryRefresh(),
        ));
  }
}
