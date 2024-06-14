import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/cubit/home/home_page_cubit.dart';
import 'package:worldcup/cubit/theme_module/change_theme_states.dart';
import 'package:worldcup/ui/home/comments_widget.dart';
import 'package:worldcup/ui/home/home_widgets/score_board.dart';
import 'package:worldcup/ui/home/home_widgets/video_player_widget.dart';

class LivePage extends StatefulWidget {
  final ChangeThemeState themeState;
  final HomePageCubit homePageCubit;

  const LivePage(
      {super.key, required this.themeState, required this.homePageCubit});

  @override
  State<LivePage> createState() => _LivePageState();
}

class _LivePageState extends State<LivePage> {
  late Function(GlobalKey) runAddToCartAnimation;
  bool showScoreCard = false;

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const VideoPlayerWidget(),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            MediaQuery.of(context).size.width > 1200
                ? Container(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                    ),
                    child: const CommentsWidget(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: const Color(0xFFB8E8BD).withOpacity(0.18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MediaQuery.of(context).size.width > 600
                  ? Row(
                      children: [
                        Text(
                          "Australia 140-7(18.5)",
                          style: AppFontStyle.interRegular16
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Shami 32(19-3)",
                          style: AppFontStyle.interRegular16
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Australia 140-7(18.5)",
                          style: AppFontStyle.interRegular16
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Shami 32(19-3)",
                          style: AppFontStyle.interRegular16
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
              InkWell(
                onTap: () {
                  setState(() {
                    showScoreCard = !showScoreCard;
                  });
                },
                child: Row(
                  children: [
                    Text(
                      "Details",
                      style: AppFontStyle.interRegular16
                          .copyWith(color: Colors.white),
                    ),
                    Icon(
                      showScoreCard
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: showScoreCard ? 20 : 0,
        ),
        showScoreCard
            ? ScoreBoard(
                height: 500,
                themeState: widget.themeState,
                ausScore: widget.homePageCubit.ausScore,
                indScore: widget.homePageCubit.indScore,
              )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 20,
        ),
        MediaQuery.of(context).size.width < 1200
            ? const CommentsWidget()
            : const SizedBox.shrink(),
      ],
    );
  }
}
