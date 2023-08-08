import 'dart:convert';
import 'package:aarakshak/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:nfc_manager/nfc_manager.dart';


Future<void> nfcStart() async {

  final Controller controller = Get.find();

  bool isNfcAvailable = await NfcManager.instance.isAvailable();
  if (isNfcAvailable) {
    NfcManager.instance.startSession(
      onDiscovered: (data) async {
        if (data != null) {
          print(data.data['nfca']['identifier']);
          Ndef? ndef = Ndef.from(data);
          if (ndef == null) {
            print('Tag is not compatible with NDEF');
          } else {
            await ndef.read().then((value) {
              value.records.forEach((element) async {
                List<int> payloadBytes = element.payload;
                String readablePayload = utf8.decode(payloadBytes);
                print(readablePayload);
                int startIndex = readablePayload.indexOf('{');
                print(startIndex);
                // String jsonData = readablePayload.substring(startIndex);
                // Map<String, dynamic> dataMap = json.decode(jsonData);
                // print("Map: $dataMap");
                // controller.latitude = dataMap["latitude"];
                // controller.longitude = dataMap["longitude"];
                // var response = await User().startDuty(controller.badgeID.toString(), controller.latitude!, controller.longitude!);
                // print(response.body);
              });
            });
          }
        }
      },
    );
  }
}
