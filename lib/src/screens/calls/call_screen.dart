import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/colors.dart';
import 'package:simorbit_app/src/consts/sizes.dart';
import 'package:simorbit_app/src/controllers/call_controller.dart';
import 'package:simorbit_app/src/screens/calls/widgets/message_card_widget.dart';
import 'package:simorbit_app/src/screens/common_widgets/shimmer.dart';

class CallScreen extends StatelessWidget {
  CallScreen({super.key});

  List<String> calls = [
    "+8801701121278",
    "+61412345678",
    '+191222333333',
    "+8801701121278",
    "+61412345678",
    '+191222333333',
    "+8801701121278",
    "+61412345678",
    '+191222333333',
    "+8801701121278",
    "+61412345678",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zWhiteColor,
      appBar: AppBar(
        backgroundColor: zWhiteColor,
        elevation: 0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: const Text("Calls",
            style: TextStyle(
              color: zTextColor,
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                CallController.instance.fetchMessages();
              },
              icon: const Icon(
                Icons.refresh_outlined,
                color: zTextColor,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: zDefaultPadding, vertical: zDefaultPadding / 2),
          child: ListView(
            children: [
              Obx(
                () => CallController.instance.isLoading.value
                    ? Column(
                        children: [
                          for (int i = 0; i < 7; i++)
                            ShimmerEffectCardWidget(
                              width: double.infinity,
                              height: 80,
                              radius: 8,
                              verticalPadding: 4,
                            ),
                        ],
                      )
                    : Column(
                        children: [
                          for (int i = 0;
                              i <
                                  CallController
                                      .instance.callModel.data!.length;
                              i++)
                            CallCardWidget(
                              time: CallController
                                  .instance.callModel.data![i].createdAt!,
                              sender: CallController
                                  .instance.callModel.data![i].phoneNo!,
                              slot: CallController
                                  .instance.callModel.data![i].imei!,
                            ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
