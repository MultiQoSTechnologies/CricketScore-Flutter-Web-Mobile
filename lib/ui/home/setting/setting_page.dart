import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/route/app_pages.dart';

class MDLProfileBox {
  IconData icon;
  String text;
  Function? onTap;

  MDLProfileBox({
    this.icon = Icons.person,
    required this.text,
    this.onTap,
  });
}

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<MDLProfileBox> _tiles = [];
  String name = '';

  void _generateTileList() {
    _tiles = [
      MDLProfileBox(
        text: "Account",
        icon: Icons.person,
      ),
      MDLProfileBox(
        text: "Notification",
        icon: Icons.notifications,
      ),
      MDLProfileBox(
        text: "Appearance",
        icon: Icons.remove_red_eye,
      ),
      MDLProfileBox(
        text: "Privacy & Security",
        icon: Icons.security,
      ),
      MDLProfileBox(
        text: "Help and Support",
        icon: Icons.headphones,
      ),
      MDLProfileBox(
        text: "About",
        icon: Icons.question_mark,
      ),
      MDLProfileBox(
        text: "Log Out",
        icon: Icons.exit_to_app,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _generateTileList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Setting",
          style: AppFontStyle.interBlack23.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: Get.height - 100,
          child: ListView.builder(
              itemCount: _tiles.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFB8E8BD).withOpacity(0.10),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _tiles[index].icon,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Text(
                          _tiles[index].text,
                          style: AppFontStyle.interRegular14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
