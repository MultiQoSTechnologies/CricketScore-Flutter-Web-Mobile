import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/cubit/home/home_page_cubit.dart';
import 'package:worldcup/cubit/theme_module/change_theme_states.dart';
import 'package:worldcup/cubit/theme_module/theme_cubit.dart';
import 'package:worldcup/ui/home/commentary_page.dart';
import 'package:worldcup/ui/home/home_widgets/home_page_main_body.dart';
import 'package:worldcup/ui/home/home_widgets/side_bar.dart';
import 'package:worldcup/ui/home/home_widgets/video_player_widget.dart';
import 'package:worldcup/ui/home/live_page.dart';
import 'package:worldcup/ui/home/schedule/schedule_page.dart';
import 'package:worldcup/ui/home/setting/setting_page.dart';

class HomeScreen extends StatefulWidget {
  final HomePageCubit homePageCubit;

  const HomeScreen({super.key, required this.homePageCubit});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AssetImages.icHomeBG), fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: BlocBuilder<ThemeCubit, ChangeThemeState>(
            bloc: changeThemeCubit,
            builder: (context, themeState) {
              return SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MediaQuery.of(context).size.width > 750
                          ? SideBar(
                              icons: widget.homePageCubit.icons,
                              index: index,
                              indexNumber: (value) {
                                setState(() {
                                  index = value;
                                });
                              },
                            )
                          : const SizedBox.shrink(),
                      MediaQuery.of(context).size.width > 750
                          ? const SizedBox(
                              width: 20,
                            )
                          : const SizedBox.shrink(),
                      Expanded(
                        child: _body(themeState: themeState),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          bottomNavigationBar: MediaQuery.of(context).size.width < 750
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SideBar(
                    icons: widget.homePageCubit.icons,
                    index: index,
                    indexNumber: (value) {
                      setState(() {
                        index = value;
                      });
                    },
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }

  Widget _body({required ChangeThemeState themeState}) {
    if (index == 0) {
      return HomePageBody(
        themeState: themeState,
        homePageCubit: widget.homePageCubit,
      );
    } else if (index == 1) {
      return LivePage(
        themeState: themeState,
        homePageCubit: widget.homePageCubit,
      );
    } else if (index == 2) {
      return const SchedulePage();
    } else if (index == 3) {
      return const CommentaryPage();
    } else {
      return const SettingPage();
    }
  }
}
