import 'package:aarakshak/widgets/session_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SessionScreenBottomList extends StatelessWidget {
  const SessionScreenBottomList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return SessionDetailCard(
                  date: index.toString(),
                );
              },
            );
          },
          child: Container(
            height: 65,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Duty Name",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "$index April",
                      style: const TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(fontSize: 11),
                    ),
                    Text(
                      "Day",
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
                index % 2 == 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/images/location_tick.svg',
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "Present",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/images/location_cross.svg',
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            "Present",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
