// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_background_service/flutter_background_service.dart';
// import 'package:flutter_background_service_android/flutter_background_service_android.dart';
// import 'package:geofence_service/geofence_service.dart';
// import 'package:geolocator/geolocator.dart';
//
// @pragma('vm:entry-point')
// Future<void> onStart(ServiceInstance service) async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // start(){
//   //   WidgetsBinding.instance.addPostFrameCallback((_) {
//   //     geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
//   //     geofenceService.addLocationChangeListener(onLocationChanged);
//   //     geofenceService.addLocationServicesStatusChangeListener(
//   //         _onLocationServicesStatusChanged);
//   //     geofenceService.addActivityChangeListener(_onActivityChanged);
//   //     geofenceService.addStreamErrorListener(_onError);
//   //     geofenceService.start(geofenceList).catchError(_onError);
//   //   });
//   // }
//
//   if (service is AndroidServiceInstance) {
//     service.on("setAsBackgroundService").listen((event) {
//       service.setAsBackgroundService();
//       // start();
//     });
//     service.on("setAsForegroundService").listen((event) {
//       service.setAsForegroundService();
//     });
//   }
//   // service.on("stopService").listen((event) {
//   //   geofenceService
//   //       .removeGeofenceStatusChangeListener(_onGeofenceStatusChanged);
//   //   geofenceService.removeLocationChangeListener(onLocationChanged);
//   //   geofenceService.removeLocationServicesStatusChangeListener(
//   //       _onLocationServicesStatusChanged);
//   //   geofenceService.removeActivityChangeListener(_onActivityChanged);
//   //   geofenceService.removeStreamErrorListener(_onError);
//   //   geofenceService.clearAllListeners();
//   //   geofenceService.stop();
//   //   service.stopSelf();
//   // });
//
//   LocationSettings settings = const LocationSettings(
//     distanceFilter: 0,
//     // accuracy: LocationAccuracy.best
//   );
//
//   Geolocator.getPositionStream(locationSettings: settings)
//       .listen((position) async {
//     Map<String, double> fetchingLocation = {
//       "speed": (position.speed * 3.6),
//       "lat": position.latitude,
//       "long": position.longitude
//     };
//     print(fetchingLocation);
//   });
// }
//
// @pragma('vm:entry-point')
// Future<void> onStartGeolocator(ServiceInstance service) async {
//   if (service is AndroidServiceInstance) {
//     service.on("setAsBackgroundService").listen((event) {
//       service.setAsBackgroundService();
//     });
//     service.on("setAsForegroundService").listen((event) {
//       service.setAsForegroundService();
//     });
//   }
//
//   service.on("stopService").listen((event) {
//     service.stopSelf();
//   });
//   final StreamController geofenceStreamController = StreamController();
//
//   final geofenceService = GeofenceService.instance.setup(
//     interval: 5000,
//     accuracy: 100,
//     loiteringDelayMs: 60000,
//     statusChangeDelayMs: 10000,
//     useActivityRecognition: true,
//     allowMockLocations: false,
//     printDevLog: false,
//     geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
//   );
//
//   final geofenceList = <Geofence>[
//     Geofence(
//       id: "Lat",
//       latitude: 100.01,
//       longitude: 121.1,
//       radius: [
//         GeofenceRadius(id: 'radius_1000m', length: 100),
//       ],
//     ),
//   ];
//
//   Future<void> _onGeofenceStatusChanged(
//       Geofence geofence,
//       GeofenceRadius geofenceRadius,
//       GeofenceStatus geofenceStatus,
//       Location location) async {
//     print('geofence: ${geofence.toJson()}');
//     print('geofenceRadius: ${geofenceRadius.toJson()}');
//     print('geofenceStatus: ${geofenceStatus.toString()}');
//     if (geofenceStatus == GeofenceStatus.ENTER) {
//       print("Currect Man");
//     }
//     if (geofenceStatus != GeofenceStatus.ENTER &&
//         geofenceStatus != GeofenceStatus.DWELL) {
//       print("Bhaar Man");
//     }
//     geofenceStreamController.sink.add(geofence);
//   }
//
//   geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
//   geofenceService.start(geofenceList);
// }
