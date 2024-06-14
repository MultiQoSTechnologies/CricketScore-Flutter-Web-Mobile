import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/ui/pod_player/src/controllers/pod_getx_video_controller.dart';
import 'package:worldcup/ui/pod_player/src/widgets/animated_play_pause_icon.dart';
import 'package:worldcup/ui/pod_player/src/widgets/core/overlays/web_dropdown_menu.dart';
import 'package:worldcup/ui/pod_player/src/widgets/material_icon_button.dart';
import 'package:worldcup/ui/pod_player/src/widgets/pod_progress_bar.dart';

class MobileBottomSheet extends StatelessWidget {
  final String tag;

  const MobileBottomSheet({
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PodGetXVideoController>(
      tag: tag,
      builder: (podCtr) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (podCtr.vimeoOrVideoUrls.isNotEmpty)
            _bottomSheetTiles(
              title: podCtr.podPlayerLabels.quality,
              icon: Icons.video_settings_rounded,
              subText: '${podCtr.vimeoPlayingVideoQuality}p',
              onTap: () {
                Navigator.of(context).pop();
                Timer(const Duration(milliseconds: 100), () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => SafeArea(
                      child: _VideoQualitySelectorMob(
                        tag: tag,
                        onTap: null,
                      ),
                    ),
                  );
                });
                // await Future.delayed(
                //   const Duration(milliseconds: 100),
                // );
              },
            ),
          _bottomSheetTiles(
            title: podCtr.podPlayerLabels.loopVideo,
            icon: Icons.loop_rounded,
            subText: podCtr.isLooping
                ? podCtr.podPlayerLabels.optionEnabled
                : podCtr.podPlayerLabels.optionDisabled,
            onTap: () {
              Navigator.of(context).pop();
              podCtr.toggleLooping();
            },
          ),
          _bottomSheetTiles(
            title: podCtr.podPlayerLabels.playbackSpeed,
            icon: Icons.slow_motion_video_rounded,
            subText: podCtr.currentPaybackSpeed,
            onTap: () {
              Navigator.of(context).pop();
              Timer(const Duration(milliseconds: 100), () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => SafeArea(
                    child: _VideoPlaybackSelectorMob(
                      tag: tag,
                      onTap: null,
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  ListTile _bottomSheetTiles({
    required String title,
    required IconData icon,
    String? subText,
    void Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      onTap: onTap,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Text(
              title,
            ),
            if (subText != null) const SizedBox(width: 6),
            if (subText != null)
              const SizedBox(
                height: 4,
                width: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            if (subText != null) const SizedBox(width: 6),
            if (subText != null)
              Text(
                subText,
                style: const TextStyle(color: Colors.grey),
              ),
          ],
        ),
      ),
    );
  }
}

class _VideoQualitySelectorMob extends StatelessWidget {
  final void Function()? onTap;
  final String tag;

  const _VideoQualitySelectorMob({
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: podCtr.vimeoOrVideoUrls
            .map(
              (e) => ListTile(
                title: Text('${e.quality}p'),
                onTap: () {
                  onTap != null ? onTap!() : Navigator.of(context).pop();

                  podCtr.changeVideoQuality(e.quality);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class _VideoPlaybackSelectorMob extends StatelessWidget {
  final void Function()? onTap;
  final String tag;

  const _VideoPlaybackSelectorMob({
    required this.onTap,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final podCtr = Get.find<PodGetXVideoController>(tag: tag);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: podCtr.videoPlaybackSpeeds
            .map(
              (e) => ListTile(
                title: Text(e),
                onTap: () {
                  onTap != null ? onTap!() : Navigator.of(context).pop();
                  podCtr.setVideoPlayBack(e);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class MobileOverlayBottomControlles extends StatelessWidget {
  final String tag;

  const MobileOverlayBottomControlles({
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    const durationTextStyle = TextStyle(color: Colors.white70);
    const itemColor = Colors.white;

    return GetBuilder<PodGetXVideoController>(
      tag: tag,
      id: 'full-screen',
      builder: (podCtr) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.all(
                MediaQuery.of(context).size.width > 600 ? 30 : 15),
            decoration: BoxDecoration(
              color: const Color(0xFF577259).withOpacity(0.5),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      MediaQuery.of(context).size.width > 600 ? 30 : 15),
              child: Row(
                children: [
                  // FittedBox(
                  //   fit: BoxFit.scaleDown,
                  //   alignment: Alignment.centerLeft,
                  //   child: Row(
                  //     children: [
                  //       // GetBuilder<PodGetXVideoController>(
                  //       //   tag: tag,
                  //       //   id: 'back',
                  //       //   builder: (podCtr) => MaterialIconButton(
                  //       //     toolTipMesg: "10 sec back",
                  //       //     color: itemColor,
                  //       //     onPressed: () {
                  //       //       podCtr.seekBackward(const Duration(seconds: 10));
                  //       //     },
                  //       //     child: const Icon(
                  //       //       Icons.replay_10_outlined,
                  //       //       color: Colors.white,
                  //       //     ),
                  //       //   ),
                  //       // ),
                  //       // AnimatedPlayPauseIcon(tag: tag),
                  //       // GetBuilder<PodGetXVideoController>(
                  //       //   tag: tag,
                  //       //   id: 'forward',
                  //       //   builder: (podCtr) => MaterialIconButton(
                  //       //     toolTipMesg: "10 sec forward",
                  //       //     color: itemColor,
                  //       //     onPressed: () {
                  //       //       podCtr.seekForward(const Duration(seconds: 10));
                  //       //     },
                  //       //     child: const Icon(
                  //       //       Icons.forward_10_outlined,
                  //       //       color: Colors.white,
                  //       //     ),
                  //       //   ),
                  //       // ),
                  //
                  //       ///video timing
                  //       // GetBuilder<PodGetXVideoController>(
                  //       //   tag: tag,
                  //       //   id: 'video-progress',
                  //       //   builder: (podCtr) {
                  //       //     return Row(
                  //       //       children: [
                  //       //         Text(
                  //       //           podCtr.calculateVideoDuration(
                  //       //             podCtr.videoPosition,
                  //       //           ),
                  //       //           style: durationTextStyle,
                  //       //         ),
                  //       //         const Text(
                  //       //           ' / ',
                  //       //           style: durationTextStyle,
                  //       //         ),
                  //       //         Text(
                  //       //           podCtr.calculateVideoDuration(
                  //       //             podCtr.videoDuration,
                  //       //           ),
                  //       //           style: durationTextStyle,
                  //       //         ),
                  //       //       ],
                  //       //     );
                  //       //   },
                  //       // ),
                  //     ],
                  //   ),
                  // ),
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
                        MaterialIconButton(
                          toolTipMesg: podCtr.isFullScreen
                              ? podCtr.podPlayerLabels.exitFullScreen ??
                                  'Exit full screen${kIsWeb ? ' (f)' : ''}'
                              : podCtr.podPlayerLabels.fullscreen ??
                                  'Fullscreen${kIsWeb ? ' (f)' : ''}',
                          color: itemColor,
                          onPressed: () {
                            if (podCtr.isOverlayVisible) {
                              if (podCtr.isFullScreen) {
                                podCtr.disableFullScreen(context, tag);
                              } else {
                                podCtr.enableFullScreen(tag);
                              }
                            } else {
                              podCtr.toggleVideoOverlay();
                            }
                          },
                          child: Icon(
                            podCtr.isFullScreen
                                ? Icons.fullscreen_exit
                                : Icons.fullscreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Row(
          //   children: [
          //     const SizedBox(width: 12),
          //     GetBuilder<PodGetXVideoController>(
          //       tag: tag,
          //       id: 'video-progress',
          //       builder: (podCtr) {
          //         return Row(
          //           children: [
          //             Text(
          //               podCtr.calculateVideoDuration(podCtr.videoPosition),
          //               style: const TextStyle(color: itemColor),
          //             ),
          //             const Text(
          //               ' / ',
          //               style: durationTextStyle,
          //             ),
          //             Text(
          //               podCtr.calculateVideoDuration(podCtr.videoDuration),
          //               style: durationTextStyle,
          //             ),
          //           ],
          //         );
          //       },
          //     ),
          //     const Spacer(),
          //     MaterialIconButton(
          //       toolTipMesg: podCtr.isFullScreen
          //           ? podCtr.podPlayerLabels.exitFullScreen ??
          //               'Exit full screen${kIsWeb ? ' (f)' : ''}'
          //           : podCtr.podPlayerLabels.fullscreen ??
          //               'Fullscreen${kIsWeb ? ' (f)' : ''}',
          //       color: itemColor,
          //       onPressed: () {
          //         if (podCtr.isOverlayVisible) {
          //           if (podCtr.isFullScreen) {
          //             podCtr.disableFullScreen(context, tag);
          //           } else {
          //             podCtr.enableFullScreen(tag);
          //           }
          //         } else {
          //           podCtr.toggleVideoOverlay();
          //         }
          //       },
          //       child: Icon(
          //         podCtr.isFullScreen
          //             ? Icons.fullscreen_exit
          //             : Icons.fullscreen,
          //       ),
          //     ),
          //   ],
          // ),
          // GetBuilder<PodGetXVideoController>(
          //   tag: tag,
          //   id: 'overlay',
          //   builder: (podCtr) {
          //     if (podCtr.isFullScreen) {
          //       return Padding(
          //         padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
          //         child: Visibility(
          //           visible: podCtr.isOverlayVisible,
          //           child: PodProgressBar(
          //             tag: tag,
          //             alignment: Alignment.topCenter,
          //             podProgressBarConfig: podCtr.podProgressBarConfig,
          //           ),
          //         ),
          //       );
          //     }
          //     return PodProgressBar(
          //       tag: tag,
          //       alignment: Alignment.bottomCenter,
          //       podProgressBarConfig: podCtr.podProgressBarConfig,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
