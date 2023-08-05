import 'dart:async';

import 'package:aarakshak/controller/user_controller.dart';
import 'package:aarakshak/widgets/current_session_bottomsheet.dart';
import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:get/get.dart';

class CurrentSessionCard extends StatefulWidget {
  const CurrentSessionCard({Key? key}) : super(key: key);

  @override
  State<CurrentSessionCard> createState() => _CurrentSessionCardState();
}

class _CurrentSessionCardState extends State<CurrentSessionCard> {
  bool firstCall = false;
  final Controller controller = Get.find();
  final StreamController _geofenceStreamController = StreamController();
  final StreamController _activityStreamController = StreamController();
  final geofenceService = GeofenceService.instance.setup(
    interval: 5000,
    accuracy: 100,
    loiteringDelayMs: 60000,
    statusChangeDelayMs: 10000,
    useActivityRecognition: true,
    allowMockLocations: false,
    printDevLog: false,
    geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
  );
  funtion() async {
    final geofenceList = <Geofence>[
      Geofence(
        id: 'place_1',
        latitude: 30.359287,
        longitude: 76.413131,
        radius: [
          GeofenceRadius(id: 'radius_1000m', length: 1000),
        ],
      ),
    ];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
      geofenceService.addLocationChangeListener(_onLocationChanged);
      geofenceService.addLocationServicesStatusChangeListener(
          _onLocationServicesStatusChanged);
      geofenceService.addActivityChangeListener(_onActivityChanged);
      geofenceService.addStreamErrorListener(_onError);
      geofenceService.start(geofenceList).catchError(_onError);
    });
  }

  @override
  void initState() {
    funtion();
    super.initState();
  }

  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    print('geofence: ${geofence.toJson()}');
    print('geofenceRadius: ${geofenceRadius.toJson()}');
    print('geofenceStatus: ${geofenceStatus.toString()}');
    if(geofenceStatus == GeofenceStatus.ENTER){
      print("Currect Man");
    }
    if(geofenceStatus != GeofenceStatus.ENTER && geofenceStatus != GeofenceStatus.DWELL){
      print("Bhaar Man");
    }
    _geofenceStreamController.sink.add(geofence);
  }

  void _onActivityChanged(Activity prevActivity, Activity currActivity) {
    print('prevActivity: ${prevActivity.toJson()}');
    print('currActivity: ${currActivity.toJson()}');
    _activityStreamController.sink.add(currActivity);
  }

  void _onLocationChanged(Location location) {
    print('location: ${location.toJson()}');
  }

  void _onLocationServicesStatusChanged(bool status) {
    print('isLocationServicesEnabled: $status');
  }

  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }

    print('ErrorCode: $errorCode');
  }

  @override
  void dispose() {
    print("Dispose");
    geofenceService
        .removeGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    geofenceService.removeLocationChangeListener(_onLocationChanged);
    geofenceService.removeLocationServicesStatusChangeListener(
        _onLocationServicesStatusChanged);
    geofenceService.removeActivityChangeListener(_onActivityChanged);
    geofenceService.removeStreamErrorListener(_onError);
    geofenceService.clearAllListeners();
    geofenceService.stop(); // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ramlila Ground",
                            style: TextStyle(
                              color: AppColors.blackText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "Chandni Chowk",
                            style: TextStyle(
                              color: AppColors.blackText,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "15 April, 2023",
                        style: TextStyle(
                          color: AppColors.blackText,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "Check-in: 05:00 pm",
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
            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => NFCCapturingScreen()));
            // final response =
            //     await User().startDuty(controller.badgeID.toString());
            // print(response.body);
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: SvgPicture.asset(
              'assets/images/tap_nfc.svg',
            ),
          ),
        ),
      ],
    );
  }
}
