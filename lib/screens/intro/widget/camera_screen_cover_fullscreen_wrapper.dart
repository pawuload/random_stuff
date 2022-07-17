import 'package:flutter/cupertino.dart';

class CameraScreenCoverFullscreenWrapper extends StatelessWidget {
  final Widget child;
  final double aspectRatio;

  const CameraScreenCoverFullscreenWrapper({
    required this.child,
    required this.aspectRatio,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var scale = constraints.biggest.aspectRatio * aspectRatio;

        // to prevent scaling down, invert the value
        if (scale < 1) scale = 1;

        return ClipRect(
          child: Transform.scale(
            scale: scale,
            child: Center(child: child),
          ),
        );
      },
    );
  }
}
