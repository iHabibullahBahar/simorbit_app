import 'package:flutter/cupertino.dart';
import 'package:simorbit_app/src/consts/colors.dart';

class CallCardWidget extends StatelessWidget {
  String time;
  String sender;
  String slot;
  CallCardWidget(
      {super.key,
      required this.time,
      required this.sender,
      required this.slot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: zGraySwatch[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(sender,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            color: zGraySwatch[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Text("IMEI: $slot"),
                          )),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(time),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
