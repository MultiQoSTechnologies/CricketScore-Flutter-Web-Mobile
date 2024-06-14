import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/cubit/theme_module/change_theme_states.dart';
import 'package:worldcup/entities/mdl_score.dart';
import 'package:worldcup/ui/home/home_widgets/title_widget.dart';

class ScoreBoardList extends StatelessWidget {
  final ChangeThemeState themeState;
  final List<MDLScore> ausScore;

  const ScoreBoardList(
      {super.key, required this.themeState, required this.ausScore});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ausScore.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        var actionData = ausScore[index];
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          ausScore[index].image,
                          width: 50,
                          height: 50,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TitleWidget(
                              title: actionData.playerName,
                              themeState: themeState,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              actionData.playerOutInfo,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: AppFontStyle.interRegular14.copyWith(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 12,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Expanded(
                        child: TitleWidget(
                          title: actionData.totalRun.toString() ?? "",
                          themeState: themeState,
                        ),
                      ),
                      Expanded(
                        child: TitleWidget(
                          title: actionData.totalBall.toString() ?? "",
                          themeState: themeState,
                        ),
                      ),
                      Expanded(
                        child: TitleWidget(
                          title: actionData.six.toString() ?? "",
                          themeState: themeState,
                        ),
                      ),
                      Expanded(
                        child: TitleWidget(
                          title: actionData.four.toString() ?? "",
                          themeState: themeState,
                        ),
                      ),
                      Expanded(
                        child: TitleWidget(
                          title: actionData.strikeRate.toString(),
                          themeState: themeState,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: const Color(0xFFB8B8B8).withOpacity(0.18),
            )
          ],
        );
      },
    );
  }
}
