import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:geofence_service/geofence_service.dart';

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on("setAsBackgroundService").listen((event) {
      service.setAsBackgroundService();
    });
    service.on("setAsForegroundService").listen((event) {
      service.setAsForegroundService();
    });
  }

  Timer _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
    print("i");
  });

  final StreamController _geofenceStreamController = StreamController();
  final StreamController _activityStreamController = StreamController();

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

  Future<void> _onGeofenceStatusChanged(
      Geofence geofence,
      GeofenceRadius geofenceRadius,
      GeofenceStatus geofenceStatus,
      Location location) async {
    print('geofence: ${geofence.toJson()}');
    print('geofenceRadius: ${geofenceRadius.toJson()}');
    print('geofenceStatus: ${geofenceStatus.toString()}');
    if (geofenceStatus == GeofenceStatus.ENTER) {
      print("Currect Man");
    }
    if (geofenceStatus != GeofenceStatus.ENTER &&
        geofenceStatus != GeofenceStatus.DWELL) {
      print("Bhaar Man");
    }
    _geofenceStreamController.sink.add(geofence);
  }

  void _onError(error) {
    final errorCode = getErrorCodesFromError(error);
    if (errorCode == null) {
      print('Undefined error: $error');
      return;
    }
    print('ErrorCode: $errorCode');
  }

  void start() {
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

  void end() {
    geofenceService
        .removeGeofenceStatusChangeListener(_onGeofenceStatusChanged);
    geofenceService.removeLocationChangeListener(_onLocationChanged);
    geofenceService.removeLocationServicesStatusChangeListener(
        _onLocationServicesStatusChanged);
    geofenceService.removeActivityChangeListener(_onActivityChanged);
    geofenceService.removeStreamErrorListener(_onError);
    geofenceService.clearAllListeners();
    geofenceService.stop();
  }
}
