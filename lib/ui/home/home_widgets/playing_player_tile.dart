import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';

class PlayingPlayerTile extends StatelessWidget {
  const PlayingPlayerTile({super.key});

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
          Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF262F27).withOpacity(0.33),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AssetImages.rohitSharma,
                    height: 35,
                    width: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Rohit",
                    style: AppFontStyle.interMedium14.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: '12',
                    style: AppFontStyle.interMedium14
                        .copyWith(color: Colors.white, fontSize: 15),
                    children: [
                      TextSpan(
                        text: '(6)',
                        style: AppFontStyle.interMedium14.copyWith(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xFF5E6D56),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    AssetImages.shubmanGill,
                    height: 35,
                    width: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Gill",
                    style: AppFontStyle.interMedium14.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Spacer(),
                RichText(
                  text: TextSpan(
                    text: '08',
                    style: AppFontStyle.interMedium14
                        .copyWith(color: Colors.white, fontSize: 15),
                    children: [
                      TextSpan(
                        text: '(6)',
                        style: AppFontStyle.interMedium14.copyWith(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
