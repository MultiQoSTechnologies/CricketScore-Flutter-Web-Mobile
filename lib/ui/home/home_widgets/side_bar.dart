import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideBar extends StatefulWidget {
  final List<String> icons;
  final Function? indexNumber;
  final int index;

  const SideBar(
      {super.key, required this.icons, this.indexNumber, required this.index});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width < 750 ? double.infinity : 80,
          decoration: BoxDecoration(
            color: const Color(0xFFB8E8BD).withOpacity(0.10),
            borderRadius: BorderRadius.circular(52.w),
            border: Border.all(color: const Color(0xFF6E7668), width: .5.w),
          ),
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.width < 750 ? 50 : null,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.icons.length,
                scrollDirection: MediaQuery.of(context).size.width < 750
                    ? Axis.horizontal
                    : Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        var callBack = widget.indexNumber;
                        if (callBack != null) {
                          callBack(index);
                        }
                      });
                    },
                    child: _sideBarIcon(
                      widget.icons[index],
                      isIconSelected: index == selectedIndex,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _sideBarIcon(String iconName, {bool isIconSelected = false}) {
    return Container(
      height: 50,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isIconSelected ? Colors.black26 : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        iconName,
      ),
    );
  }
}
