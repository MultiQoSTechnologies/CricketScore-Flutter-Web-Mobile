import 'package:flutter/material.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/cubit/theme_module/change_theme_states.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final ChangeThemeState themeState;
  final bool? boldStyle;
  final TextAlign? textAlign;

  const TitleWidget(
      {super.key,
      required this.title,
      required this.themeState,
      this.boldStyle = false,
      this.textAlign = TextAlign.end});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Text(
        title,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        style: boldStyle ?? false
            ? AppFontStyle.interMedium14.copyWith(
                color: Colors.white.withOpacity(0.5),
                fontSize: 14,
              )
            : AppFontStyle.interRegular14.copyWith(
                color: Colors.white,
                fontSize: 12,
              ),
      ),
    );
  }
}
