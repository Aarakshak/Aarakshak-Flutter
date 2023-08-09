import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/widgets/current_session_bottomsheet.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tzl;
import 'package:timezone/standalone.dart' as tz;
import '../screens/nfc_capturing_screen.dart';

class CurrentSessionCard extends StatefulWidget {
  const CurrentSessionCard({Key? key}) : super(key: key);

  @override
  State<CurrentSessionCard> createState() => _CurrentSessionCardState();
}

class _CurrentSessionCardState extends State<CurrentSessionCard> {
  bool firstCall = false;
  final Controller controller = Get.find();

  notificationCode() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestPermission();

    tzl.initializeTimeZones();
    for (int i = 0; i < controller.checkpoints.length; i++) {
      String timestampString = controller.checkpoints[i]["timestamp"];
      tz.TZDateTime dateTime =
          tz.TZDateTime.parse(tz.getLocation('UTC'), timestampString);
      print(dateTime);
      await flutterLocalNotificationsPlugin.zonedSchedule(
        i,
        "Attendance",
        "5 minutes buffer only",
        dateTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel_id_attendance',
            'Attendance Notifications',
            importance: Importance.max,
            priority: Priority.high,
          ),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    }
  }

  @override
  void initState() {
    notificationCode();
    super.initState();
  }

  extra() async {
    print("Hello");
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    List<PendingNotificationRequest> pendingNotifications =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();

    for (PendingNotificationRequest notification in pendingNotifications) {
      print("Notification ID: ${notification.id}");
      print("Title: ${notification.title}");
      print("Body: ${notification.body}");
      print("Scheduled Time: ${notification}");
      print("------------------------");
    }
  }

  @override
  Widget build(BuildContext context) {
    extra();
    return controller.checkInTime != null && controller.checkInTime != null
        ? Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return const CurrentSession();
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xa5ab8ee3)),
                    color: const Color(0x11ab8ee3),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.location1}",
                              style: TextStyle(
                                color: AppColors.blackText,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              DateFormat("dd MMMM, yyyy")
                                  .format(controller.checkInTime!),
                              style: TextStyle(
                                color: AppColors.blackText,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "Check-in: ${DateFormat("hh:mm a").format(controller.checkInTime!)}",
                              style: TextStyle(
                                color: AppColors.blackText,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const NFCCapturingScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: SvgPicture.asset(
                    'assets/images/tap_nfc.svg',
                  ),
                ),
              ),
            ],
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xa5ab8ee3)),
              color: const Color(0x11ab8ee3),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Center(
              child: Text(
                "No current sessions",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          );
  }
}
