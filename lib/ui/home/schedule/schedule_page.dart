import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:worldcup/constant/app_assets.dart';
import 'package:worldcup/constant/font_style.dart';
import 'package:worldcup/entities/mdl_schedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<MDLSchedule> schedules = [
    MDLSchedule(
        group: "Group A",
        t1: "India",
        t2: "Pakistan",
        imageT1: AssetImages.india,
        imageT2: AssetImages.pakistan,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 10:00 AM",
        date: "6 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "Afghanistan",
        t2: "Australia",
        imageT1: AssetImages.afghanistan,
        imageT2: AssetImages.australia,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 12:00 PM",
        date: "7 March 2024"),
    MDLSchedule(
        group: "Group A",
        t1: "Bangladesh",
        t2: "Canada",
        imageT1: AssetImages.bangladesh,
        imageT2: AssetImages.canada,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 2:00 PM",
        date: "8 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "England",
        t2: "India",
        imageT1: AssetImages.england,
        imageT2: AssetImages.india,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 4:00 PM",
        date: "9 March 2024"),
    MDLSchedule(
        group: "Group C",
        t1: "Namibia",
        t2: "New Zealand",
        imageT1: AssetImages.namibia,
        imageT2: AssetImages.newZealand,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 6:00 PM",
        date: "10 March 2024"),
    MDLSchedule(
        group: "Group A",
        t1: "Pakistan",
        t2: "South Africa",
        imageT1: AssetImages.pakistan,
        imageT2: AssetImages.southAfrica,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 8:00 PM",
        date: "10 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "South Africa",
        t2: "Sri Lanka",
        imageT1: AssetImages.southAfrica,
        imageT2: AssetImages.sriLanka,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 10:00 PM",
        date: "11 March 2024"),
    MDLSchedule(
        group: "Group A",
        t1: "Namibia",
        t2: "Afghanistan",
        imageT1: AssetImages.namibia,
        imageT2: AssetImages.afghanistan,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 9:00 AM",
        date: "12 March 2024"),
    MDLSchedule(
        group: "Group C",
        t1: "India",
        t2: "Bangladesh",
        imageT1: AssetImages.india,
        imageT2: AssetImages.bangladesh,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 11:00 AM",
        date: "13 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "Australia",
        t2: "New Zealand",
        imageT1: AssetImages.australia,
        imageT2: AssetImages.newZealand,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 1:00 PM",
        date: "14 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "England",
        t2: "Pakistan",
        imageT1: AssetImages.england,
        imageT2: AssetImages.pakistan,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 3:00 PM",
        date: "15 March 2024"),
    MDLSchedule(
        group: "Group A",
        t1: "Namibia",
        t2: "India",
        imageT1: AssetImages.namibia,
        imageT2: AssetImages.india,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 5:00 PM",
        date: "16 March 2024"),
    MDLSchedule(
        group: "Group C",
        t1: "Australia",
        t2: "Sri Lanka",
        imageT1: AssetImages.australia,
        imageT2: AssetImages.sriLanka,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 7:00 PM",
        date: "17 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "South Africa",
        t2: "Australia",
        imageT1: AssetImages.southAfrica,
        imageT2: AssetImages.australia,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 9:00 PM",
        date: "18 March 2024"),
    MDLSchedule(
        group: "Group B",
        t1: "Nepal",
        t2: "Pakistan",
        imageT1: AssetImages.nepal,
        imageT2: AssetImages.pakistan,
        locationAndTime:
            "New York, Nassau County International Cricket Stadium, 11:00 PM",
        date: "19 March 2024"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Schedule",
          style: AppFontStyle.interBlack23.copyWith(color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                splashBorderRadius: BorderRadius.circular(20.r),
                indicator: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                tabs: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Text(
                      "Live",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: AppFontStyle.interMedium14.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Text(
                      "Upcoming",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: AppFontStyle.interMedium14.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: Get.height - 100,
                child: TabBarView(children: [
                  _scheduleList(list: schedules),
                  _scheduleList(list: schedules, reverse: true),
                ]),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _scheduleList({required List<MDLSchedule> list, bool? reverse}) {
    return ListView.builder(
      itemCount: list.length,
      reverse: reverse ?? false,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: const Color(0xFFB8E8BD).withOpacity(0.10),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index].group,
                    style: AppFontStyle.interRegular14
                        .copyWith(color: Colors.white),
                  ),
                  Text(
                    list[index].date,
                    style: AppFontStyle.interRegular14
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        list[index].imageT1,
                        height: 50,
                        width: 100,
                      ),
                      // CachedNetworkImage(
                      //   height: 50,
                      //   width: 100,
                      //   imageUrl: list[index].imageT1,
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      // ),
                      Text(
                        list[index].t1,
                        style: AppFontStyle.interRegular14
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "Vs",
                    style: AppFontStyle.interRegular14
                        .copyWith(color: Colors.white),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        list[index].imageT2,
                        height: 50,
                        width: 100,
                      ),
                      // CachedNetworkImage(
                      //   height: 50,
                      //   width: 100,
                      //   imageUrl: list[index].imageT2,
                      //   errorWidget: (context, url, error) =>
                      //       const Icon(Icons.error),
                      // ),
                      Text(
                        list[index].t2,
                        style: AppFontStyle.interRegular14
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                list[index].locationAndTime,
                style: AppFontStyle.interRegular14.copyWith(color: Colors.grey),
              )
            ],
          ),
        );
      },
    );
  }
}
