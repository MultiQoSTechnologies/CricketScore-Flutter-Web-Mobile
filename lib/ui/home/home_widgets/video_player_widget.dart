import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldcup/ui/pod_player/pod_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
        'https://firebasestorage.googleapis.com/v0/b/fir-85d6f.appspot.com/o/Cricket%20World%20Cup%202023%20Final_%20Australia%20v%20India%20_%20Match%20Highlights.mp4?alt=media&token=95e85975-0d32-429c-b737-61b600634266',
      ),
    )..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(
      controller: controller,
      alwaysShowProgressBar: false,
    );
  }
}
