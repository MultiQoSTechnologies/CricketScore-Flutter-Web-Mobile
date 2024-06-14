import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';

class BowlingTail extends StatelessWidget {
  const BowlingTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(21),
      decoration: BoxDecoration(
        color: const Color(0xFFB8E8BD).withOpacity(0.18),
        borderRadius: BorderRadius.circular(43),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AssetImages.icAustralianFlag,
                height: 30,
                width: 30,
              ),
              Text(
                " AUS bowling",
                style: AppFontStyle.interRegular14.copyWith(
                    color: Colors.white.withOpacity(0.5), fontSize: 18),
              )
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Center(
            child: Text(
              "• Adam Zampa 1/29(8.4)",
              style: AppFontStyle.interMedium14.copyWith(
                color: Colors.white,
                fontSize: 18,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              6,
              (index) => Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: const Color(0xFF586150),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
