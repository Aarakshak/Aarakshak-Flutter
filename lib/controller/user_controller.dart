import 'package:get/get.dart';

class Controller extends GetxController{
  var index = 0.obs;
  change(int value) => index.value = value;
}