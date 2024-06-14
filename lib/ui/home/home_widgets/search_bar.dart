import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(3.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xFFB8E8BD).withOpacity(0.10),
          borderRadius: BorderRadius.circular(52.r),
          border: Border.all(color: const Color(0xFF6E7668), width: .5.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 5.w,
            ),
            MediaQuery
                .of(context)
                .size
                .width > 600
                ? _arrowButtons()
                : const SizedBox.shrink(),
            MediaQuery
                .of(context)
                .size
                .width > 600 ?
            const SizedBox(
              width: 20,
            ) : const SizedBox.shrink(),
            _customSearchBarTextField(),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                profileDialog(context);
              },
              child: _userInfo(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customSearchBarTextField() {
    return Expanded(
      child: TextField(
        cursorColor: Colors.white,
        style: AppFontStyle.interRegular14
            .copyWith(color: Colors.white, fontSize: 18),
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          filled: true,
          hintStyle: AppFontStyle.interRegular14
              .copyWith(color: Colors.white.withOpacity(0.5), fontSize: 18),
          hintText: "Search here",
          fillColor: const Color(0xFF262F27).withOpacity(0.33),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: SvgPicture.asset(
              AssetImages.icSearch,
            ),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: SvgPicture.asset(
              AssetImages.icMic,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 2.w),
          prefixIconConstraints: BoxConstraints(
            minWidth: 10.w,
            minHeight: 10.w,
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 10.w,
            minHeight: 10.w,
          ),
        ),
      ),
    );
  }

  Widget _commonCustomSearchBarIcon(String icon) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: const Color(0xFF4D5F4A),
          borderRadius: BorderRadius.circular(40)),
      child: SvgPicture.asset(
        icon,
        width: 5.w,
        height: 30.h,
      ),
    );
  }

  Widget _userInfo(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AssetImages.icAvtar,
          height: 50,
          width: 50,
        ),
        const SizedBox(
          width: 10,
        ),
        MediaQuery
            .of(context)
            .size
            .width > 500 ?
        Row(
          children: [
            Text(
              "Lucas Davis",
              style: AppFontStyle.interMedium14
                  .copyWith(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              width: 10,
            ),
            SvgPicture.asset(
              AssetImages.icDownArrow,
              width: 25.w,
              height: 20.h,
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ) : const SizedBox.shrink(),
      ],
    );
  }

  Widget _arrowButtons() {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(5.w).copyWith(right: 4.w, left: 4.w),
          decoration: const BoxDecoration(
            color: Color(0xFF4D5F4A),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AssetImages.icMenu,
            width: 5.w,
            height: 18.h,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          padding: EdgeInsets.all(5.w).copyWith(right: 5.w, left: 5.w),
          decoration: const BoxDecoration(
            color: Color(0xFF4D5F4A),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AssetImages.icLeftArrow,
            width: 5.w,
            height: 18.h,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Container(
          padding: EdgeInsets.all(5.w).copyWith(right: 5.w, left: 5.w),
          decoration: const BoxDecoration(
            color: Color(0xFF4D5F4A),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AssetImages.icRightArrow,
            width: 5.w,
            height: 18.h,
          ),
        ),
      ],
    );
  }

  Future profileDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (_) {
        return Stack(
          children: [
            Positioned(
              right: 10.w,
              top: 60,
              child: AlertDialog(
                backgroundColor: const Color(0xFF4F6E52).withOpacity(0.9),
                title: Column(
                  children: [
                    Image.asset(
                      AssetImages.icAvtar,
                      scale: 0.7,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Lucas Davis",
                      style: AppFontStyle.interBlack14.copyWith(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "lacasdavis@gmail.com",
                      style: AppFontStyle.interRegular14.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Divider(),
                    dialogList(icon: Icons.settings, title: "Setting"),
                    const SizedBox(
                      height: 10,
                    ),
                    dialogList(icon: Icons.person, title: "Profile"),
                    const SizedBox(
                      height: 10,
                    ),
                    dialogList(icon: Icons.exit_to_app, title: "Log Out"),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget dialogList({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: AppFontStyle.interRegular14.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
