import 'package:flutter/cupertino.dart';
import 'package:readmore/readmore.dart';
import 'package:simorbit_app/src/consts/colors.dart';

class MessageCardWidget extends StatelessWidget {
  String message;
  String time;
  String sender;
  String slot;
  MessageCardWidget(
      {super.key,
      required this.message,
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
                  Text(sender),
                  const Spacer(),
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
                ],
              ),
              const SizedBox(height: 8),
              ReadMoreText(
                message,
                trimLines: 2,
                colorClickableText: zPrimaryColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                moreStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                lessStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Spacer(),
                  Text(time),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
