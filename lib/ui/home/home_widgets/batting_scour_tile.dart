import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';

class BattingScourTail extends StatelessWidget {
  const BattingScourTail({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
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
                  AssetImages.icIndianFlag,
                  height: 30,
                  width: 30,
                ),
                Text(
                  " IND batting",
                  style: AppFontStyle.interRegular14.copyWith(
                      color: Colors.white.withOpacity(0.5), fontSize: 18),
                )
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '140-8 ',
                  style: AppFontStyle.interRegular14
                      .copyWith(color: Colors.white, fontSize: 24),
                  children: [
                    TextSpan(
                      text: '(36.2)',
                      style: AppFontStyle.interRegular14.copyWith(
                        color: Colors.white.withOpacity(0.5),
                        fontSize: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Center(
              child: Text(
                "IND choose to bat • CRR: 3.94",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: AppFontStyle.interRegular14.copyWith(
                    color: Colors.white.withOpacity(0.5), fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
