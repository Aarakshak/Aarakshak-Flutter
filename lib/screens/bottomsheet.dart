import 'package:flutter/material.dart';

class CurrentSession extends StatelessWidget {
  const CurrentSession({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 600,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              child: Image.asset(
                "assets/images/map_image.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
