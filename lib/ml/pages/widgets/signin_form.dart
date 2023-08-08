import 'package:aarakshak/ml/pages/profile.dart';
import 'package:aarakshak/ml/services/camera.service.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';
import '../models/user.model.dart';
import 'app_button.dart';
import 'app_text_field.dart';

class SignInSheet extends StatelessWidget {
  SignInSheet({Key? key, required this.user}) : super(key: key);
  final User user;

  final _passwordController = TextEditingController();
  final _cameraService = locator<CameraService>();

  Future _signIn(context, user) async {
    if (user.password == _passwordController.text) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => Profile(
                    user.user,
                    imagePath: _cameraService.imagePath!,
                  )));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Wrong password!'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              'Welcome back, ${user.user}.',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Column(
              children: [
                const SizedBox(height: 10),
                AppTextField(
                  controller: _passwordController,
                  labelText: "Password",
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                AppButton(
                  text: 'LOGIN',
                  onPressed: () async {
                    _signIn(context, user);
                  },
                  icon: const Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
