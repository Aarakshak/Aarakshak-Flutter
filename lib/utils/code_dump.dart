// Geofence Code

// final StreamController _geofenceStreamController = StreamController();
// final StreamController _activityStreamController = StreamController();
// final geofenceService = GeofenceService.instance.setup(
//   interval: 5000,
//   accuracy: 100,
//   loiteringDelayMs: 60000,
//   statusChangeDelayMs: 10000,
//   useActivityRecognition: true,
//   allowMockLocations: false,
//   printDevLog: false,
//   geofenceRadiusSortType: GeofenceRadiusSortType.DESC,
// );
//
// final geofenceList = <Geofence>[
//   Geofence(
//     id: 'place_1',
//     latitude: 30.359287,
//     longitude: 76.413131,
//     radius: [
//       GeofenceRadius(id: 'radius_1000m', length: 1000),
//     ],
//   ),
// ];
//
// Future<void> _onGeofenceStatusChanged(
//     Geofence geofence,
//     GeofenceRadius geofenceRadius,
//     GeofenceStatus geofenceStatus,
//     Location location) async {
//   print('geofence: ${geofence.toJson()}');
//   print('geofenceRadius: ${geofenceRadius.toJson()}');
//   print('geofenceStatus: ${geofenceStatus.toString()}');
//   _geofenceStreamController.sink.add(geofence);
// }
//
// void _onActivityChanged(Activity prevActivity, Activity currActivity) {
//   print('prevActivity: ${prevActivity.toJson()}');
//   print('currActivity: ${currActivity.toJson()}');
//   _activityStreamController.sink.add(currActivity);
// }
//
// void _onLocationChanged(Location location) {
//   print('location: ${location.toJson()}');
// }
//
// void _onLocationServicesStatusChanged(bool status) {
//   print('isLocationServicesEnabled: $status');
// }
//
// void _onError(error) {
//   final errorCode = getErrorCodesFromError(error);
//   if (errorCode == null) {
//     print('Undefined error: $error');
//     return;
//   }
//
//   print('ErrorCode: $errorCode');
// }
//
// @override
// void initState() {
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     geofenceService.addGeofenceStatusChangeListener(_onGeofenceStatusChanged);
//     geofenceService.addLocationChangeListener(_onLocationChanged);
//     geofenceService.addLocationServicesStatusChangeListener(_onLocationServicesStatusChanged);
//     geofenceService.addActivityChangeListener(_onActivityChanged);
//     geofenceService.addStreamErrorListener(_onError);
//     geofenceService.start(geofenceList).catchError(_onError);
//   });
//   super.initState();
// }