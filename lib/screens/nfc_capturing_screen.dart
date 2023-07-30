import 'package:aarakshak/ui_components/colors/color_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nfc_manager/nfc_manager.dart';

class NFCCapturingScreen extends StatefulWidget {
  const NFCCapturingScreen({super.key});

  @override
  State<NFCCapturingScreen> createState() => _NFCCapturingScreenState();
}

class _NFCCapturingScreenState extends State<NFCCapturingScreen> {
  String value = "Not connected";
  String thisData = "No data";
  String onemorevalue = "one more value";

  Future<void> start() async {
    bool isNfcAvailable = await NfcManager.instance.isAvailable();
    if (isNfcAvailable) {
      NfcManager.instance.startSession(
        onDiscovered: (data) async {
          if (data != null) {
            setState(() {
              value = "Connected";
              thisData = data.data.toString();
              onemorevalue = data.handle;
            });
          }
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.profileCardBackgroundColor,
      body: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.only(top: 40, right: 10),
              child: SvgPicture.asset(
                'assets/images/circular_close.svg',
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff062D61),
                  ),
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      heightFactor: 0.5,
                      child: SvgPicture.asset(
                        'assets/images/nfc_icon.svg',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Hold your phone onto the tag",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
                Text(value),
                Text(thisData),
                Text(onemorevalue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
