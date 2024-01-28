import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/colors.dart';
import 'package:simorbit_app/src/consts/sizes.dart';
import 'package:simorbit_app/src/controllers/message_controllers.dart';
import 'package:simorbit_app/src/screens/common_widgets/shimmer.dart';
import 'package:simorbit_app/src/screens/messages/widgets/message_card_widget.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});
  List<String> messages = [
    "Hello Habib, How are you?",
    "I am going to the market",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
    "That was a great day",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
    "Have you seen the new movie?",
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: zWhiteColor,
      appBar: AppBar(
        backgroundColor: zWhiteColor,
        elevation: 0,
        automaticallyImplyLeading: false, // Don't show the leading button
        title: const Text("Messages",
            style: TextStyle(
              color: zTextColor,
              fontWeight: FontWeight.w600,
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
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
                () => MessageController.instance.isLoading.value
                    ? Column(
                        children: [
                          for (int i = 0; i < 7; i++)
                            ShimmerEffectCardWidget(
                              width: double.infinity,
                              height: 100,
                              radius: 8,
                              verticalPadding: 4,
                            ),
                        ],
                      )
                    : Column(
                        children: [
                          for (int i = 0; i < messages.length; i++)
                            MessageCardWidget(
                              message: messages[i],
                              time: "28/08/2021 12:00",
                              sender: "+8801701121278",
                              slot: 1,
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
