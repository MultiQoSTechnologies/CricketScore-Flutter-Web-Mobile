import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/cubit/theme_module/change_theme_states.dart';
import 'package:worldcup/entities/mdl_score.dart';
import 'package:worldcup/ui/home/home_widgets/score_board_list.dart';
import 'package:worldcup/ui/home/home_widgets/title_widget.dart';

class ScoreBoard extends StatefulWidget {
  final ChangeThemeState themeState;
  final List<MDLScore> ausScore;
  final List<MDLScore> indScore;
  final double? height;

  const ScoreBoard({
    super.key,
    required this.themeState,
    required this.ausScore,
    this.height, required this.indScore,
  });

  @override
  State<ScoreBoard> createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 110.w,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xFFB8E8BD).withOpacity(0.18),
      ),
      child: Column(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'SCOREBOARD',
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyle.interRegular14.copyWith(
                      color: Colors.white,
                      fontSize: 13,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    tabs: [
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            "Australia",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppFontStyle.interMedium14.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          child: Text(
                            "India",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: AppFontStyle.interMedium14.copyWith(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: TitleWidget(
                        title: "Batting",
                        themeState: widget.themeState,
                        boldStyle: true,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TitleWidget(
                        title: "R",
                        themeState: widget.themeState,
                        boldStyle: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TitleWidget(
                        title: "B",
                        themeState: widget.themeState,
                        boldStyle: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TitleWidget(
                        title: "6s",
                        themeState: widget.themeState,
                        boldStyle: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TitleWidget(
                        title: "4s",
                        themeState: widget.themeState,
                        boldStyle: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: TitleWidget(
                        title: "S/R",
                        themeState: widget.themeState,
                        boldStyle: true,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: const Color(0xFFB8B8B8).withOpacity(0.18),
                ),
              ],
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: [
                ScoreBoardList(
                    themeState: widget.themeState, ausScore: widget.ausScore),
                ScoreBoardList(
                    themeState: widget.themeState, ausScore: widget.indScore),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
