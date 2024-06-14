import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldcup/cubit/home/home_page_cubit.dart';
import 'package:worldcup/cubit/theme_module/change_theme_states.dart';
import 'package:worldcup/ui/home/home_widgets/batting_scour_tile.dart';
import 'package:worldcup/ui/home/home_widgets/bowling_tile.dart';
import 'package:worldcup/ui/home/home_widgets/playing_player_tile.dart';
import 'package:worldcup/ui/home/home_widgets/score_board.dart';
import 'package:worldcup/ui/home/home_widgets/search_bar.dart';
import 'package:worldcup/ui/home/home_widgets/video_player_widget.dart';

class HomePageBody extends StatefulWidget {
  final ChangeThemeState themeState;
  final HomePageCubit homePageCubit;

  const HomePageBody(
      {super.key, required this.themeState, required this.homePageCubit});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomSearchBar(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  // height: 112.w,
                  // width: 200.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const VideoPlayerWidget(),
                  ),
                ),
              ),
              MediaQuery.of(context).size.width > 1200
                  ? SizedBox(
                      width: 5.w,
                    )
                  : const SizedBox.shrink(),
              MediaQuery.of(context).size.width > 1200
                  ? Expanded(
                      child: ScoreBoard(
                          themeState: widget.themeState,
                          ausScore: widget.homePageCubit.ausScore,
                          indScore: widget.homePageCubit.indScore,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        MediaQuery.of(context).size.width < 1200
            ? const Flexible(
                child: PlayingPlayerTile(),
              )
            : const SizedBox.shrink(),
        MediaQuery.of(context).size.width < 1200
            ? const SizedBox(
                height: 20,
              )
            : const SizedBox.shrink(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MediaQuery.of(context).size.width > 1200
                ? const Flexible(
                    child: PlayingPlayerTile(),
                  )
                : const SizedBox.shrink(),
            MediaQuery.of(context).size.width > 1200
                ? SizedBox(
                    width: 5.w,
                  )
                : const SizedBox.shrink(),
            const Flexible(
              child: BattingScourTail(),
            ),
            SizedBox(
              width: 5.w,
            ),
            MediaQuery.of(context).size.width > 750
                ? const Flexible(
                    child: BowlingTail(),
                  )
                : const SizedBox.shrink(),
          ],
        ),
        SizedBox(
          height: 20.w,
        ),
        MediaQuery.of(context).size.width < 750
            ? const Flexible(
                child: BowlingTail(),
              )
            : const SizedBox.shrink(),
        MediaQuery.of(context).size.width < 750
            ? SizedBox(
                height: 20.w,
              )
            : const SizedBox.shrink(),
        MediaQuery.of(context).size.width < 1200
            ? ScoreBoard(
              themeState: widget.themeState,
              ausScore: widget.homePageCubit.ausScore,
              indScore: widget.homePageCubit.indScore,
              height: MediaQuery.of(context).size.width > 750 ? 200.w : 500,
            )
            : const SizedBox.shrink(),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
