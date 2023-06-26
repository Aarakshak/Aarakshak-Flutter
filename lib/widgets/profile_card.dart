import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 27, 20),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xff056ABB),
        borderRadius: BorderRadius.circular(23),
      ),
      child: Row(
        children: [
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      "Rank",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "Head Constable",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    Text(
                      "Badge No.",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Text(
                      "XXXXXX",
                      style:
                      TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
