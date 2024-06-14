import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/ui/pod_player/src/controllers/pod_getx_video_controller.dart';
import 'package:worldcup/ui/pod_player/src/utils/enums.dart';
import 'package:worldcup/ui/pod_player/src/widgets/animated_play_pause_icon.dart';
import 'package:worldcup/ui/pod_player/src/widgets/core/overlays/web_dropdown_menu.dart';
import 'package:worldcup/ui/pod_player/src/widgets/core/video_gesture_detector.dart';
import 'package:worldcup/ui/pod_player/src/widgets/double_tap_icon.dart';
import 'package:worldcup/ui/pod_player/src/widgets/material_icon_button.dart';
import 'package:worldcup/ui/pod_player/src/widgets/pod_progress_bar.dart';
import 'package:universal_html/html.dart' as uni_html;

class WebOverlay extends StatelessWidget {
  final String tag;

  const WebOverlay({
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    const overlayColor = Colors.black38;
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, left: 30),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF577259).withOpacity(0.5),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            "ICC CWC: IND vs AUS",
            style: AppFontStyle.interRegular14.copyWith(color: Colors.white),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 30),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF577259).withOpacity(0.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "2.5cr Views",
              style: AppFontStyle.interRegular14.copyWith(color: Colors.white),
            ),
          ),
        ),
        Positioned.fill(
          child: VideoGestureDetector(
            tag: tag,
            onTap: podCtr.togglePlayPauseVideo,
            onDoubleTap: () => podCtr.toggleFullScreenOnWeb(context, tag),
            child: const ColoredBox(
              color: overlayColor,
              child: SizedBox.expand(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: _WebOverlayBottomControlles(
            tag: tag,
          ),
        ),
        Positioned.fill(
          child: GetBuilder<PodGetXVideoController>(
            tag: tag,
            id: 'double-tap',
            builder: (podCtr) {
              return Row(
                children: [
                  Expanded(
                    child: IgnorePointer(
                      child: DoubleTapIcon(
                        onDoubleTap: () {},
                        tag: tag,
                        isForward: false,
                        iconOnly: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: IgnorePointer(
                      child: DoubleTapIcon(
                        onDoubleTap: () {},
                        tag: tag,
                        isForward: true,
                        iconOnly: true,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        IgnorePointer(child: podCtr.videoTitle ?? const SizedBox()),
      ],
    );
  }
}

class _WebOverlayBottomControlles extends StatelessWidget {
  final String tag;

  const _WebOverlayBottomControlles({
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    const durationTextStyle = TextStyle(color: Colors.white70);
    const itemColor = Colors.white;

    return MouseRegion(
      onHover: (event) => podCtr.onOverlayHover(),
      onExit: (event) => podCtr.onOverlayHoverExit(),
      child: Container(
        margin:
            EdgeInsets.all(MediaQuery.of(context).size.width > 600 ? 30 : 15),
        decoration: BoxDecoration(
          color: const Color(0xFF577259).withOpacity(0.5),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width > 600 ? 30 : 15),
          child: Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    GetBuilder<PodGetXVideoController>(
                      tag: tag,
                      id: 'back',
                      builder: (podCtr) => MaterialIconButton(
                        toolTipMesg: "10 sec back",
                        color: itemColor,
                        onPressed: () {
                          podCtr.seekBackward(const Duration(seconds: 10));
                        },
                        child: const Icon(
                          Icons.replay_10_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    AnimatedPlayPauseIcon(tag: tag),
                    GetBuilder<PodGetXVideoController>(
                      tag: tag,
                      id: 'forward',
                      builder: (podCtr) => MaterialIconButton(
                        toolTipMesg: "10 sec forward",
                        color: itemColor,
                        onPressed: () {
                          podCtr.seekForward(const Duration(seconds: 10));
                        },
                        child: const Icon(
                          Icons.forward_10_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    GetBuilder<PodGetXVideoController>(
                      tag: tag,
                      id: 'volume',
                      builder: (podCtr) => MaterialIconButton(
                        toolTipMesg: podCtr.isMute
                            ? podCtr.podPlayerLabels.unmute ??
                                'Unmute${kIsWeb ? ' (m)' : ''}'
                            : podCtr.podPlayerLabels.mute ??
                                'Mute${kIsWeb ? ' (m)' : ''}',
                        color: itemColor,
                        onPressed: podCtr.toggleMute,
                        child: Icon(
                          podCtr.isMute
                              ? Icons.volume_off_rounded
                              : Icons.volume_up_rounded,
                        ),
                      ),
                    ),

                    ///video timing
                    // GetBuilder<PodGetXVideoController>(
                    //   tag: tag,
                    //   id: 'video-progress',
                    //   builder: (podCtr) {
                    //     return Row(
                    //       children: [
                    //         Text(
                    //           podCtr.calculateVideoDuration(
                    //             podCtr.videoPosition,
                    //           ),
                    //           style: durationTextStyle,
                    //         ),
                    //         const Text(
                    //           ' / ',
                    //           style: durationTextStyle,
                    //         ),
                    //         Text(
                    //           podCtr.calculateVideoDuration(
                    //             podCtr.videoDuration,
                    //           ),
                    //           style: durationTextStyle,
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: PodProgressBar(
                  tag: tag,
                  podProgressBarConfig: podCtr.podProgressBarConfig,
                ),
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerRight,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      width: 5,
                      height: 5,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Live",
                      style: AppFontStyle.interRegular14
                          .copyWith(color: Colors.white),
                    ),
                    // MaterialIconButton(
                    //   toolTipMesg: "Subtitle",
                    //   color: itemColor,
                    //   onPressed: () {
                    //     ///Logic for subtitle
                    //   },
                    //   child: const Icon(Icons.subtitles),
                    // ),
                    MaterialIconButton(
                      toolTipMesg: podCtr.isFullScreen
                          ? podCtr.podPlayerLabels.exitFullScreen ??
                              'Exit full screen${kIsWeb ? ' (f)' : ''}'
                          : podCtr.podPlayerLabels.fullscreen ??
                              'Fullscreen${kIsWeb ? ' (f)' : ''}',
                      color: itemColor,
                      onPressed: () {
                        _onFullScreenToggle(podCtr, context);
                      },
                      child: Icon(
                        podCtr.isFullScreen
                            ? Icons.fullscreen_exit
                            : Icons.fullscreen,
                      ),
                    ),
                    WebSettingsDropdown(tag: tag),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onFullScreenToggle(
    PodGetXVideoController podCtr,
    BuildContext context,
  ) {
    if (podCtr.isOverlayVisible) {
      if (podCtr.isFullScreen) {
        if (kIsWeb) {
          uni_html.document.exitFullscreen();
          podCtr.disableFullScreen(context, tag);
          return;
        } else {
          podCtr.disableFullScreen(context, tag);
        }
      } else {
        if (kIsWeb) {
          uni_html.document.documentElement?.requestFullscreen();
          podCtr.enableFullScreen(tag);
          return;
        } else {
          podCtr.enableFullScreen(tag);
        }
      }
    } else {
      podCtr.toggleVideoOverlay();
    }
  }
}
