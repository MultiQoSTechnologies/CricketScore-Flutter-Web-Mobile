import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:worldcup/constant/app_constant.dart';
import 'package:worldcup/cubit/home/home_page_cubit.dart';
import 'package:worldcup/route/app_routes.dart';
import 'package:worldcup/ui/home/tab_bar.dart';

class MainAppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.homePage,
      page: () => HomeScreen(
        homePageCubit: HomePageCubit(),
      ),
      transition: Transition.rightToLeft,
      transitionDuration: AppConstant.animationDuration,
    ),
  ];
}
