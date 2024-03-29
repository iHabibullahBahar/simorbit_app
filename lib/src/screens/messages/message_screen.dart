import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/colors.dart';
import 'package:simorbit_app/src/consts/sizes.dart';
import 'package:simorbit_app/src/controllers/message_controllers.dart';
import 'package:simorbit_app/src/screens/common_widgets/shimmer.dart';
import 'package:simorbit_app/src/screens/messages/widgets/message_card_widget.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  MessageController messageController = Get.put(MessageController());
  // List<String> messages = [
  //   "Hello Habib, How are you?",
  //   "I am going to the market",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
  //   "That was a great day",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
  //   "Have you seen the new movie?",
  //   "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec",
  // ];

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
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {
                MessageController.instance.fetchMessages();
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
                          for (int i = 0;
                              i <
                                  MessageController
                                      .instance.messageModel.data!.length;
                              i++)
                            MessageCardWidget(
                              message: MessageController
                                  .instance.messageModel.data![i].content!,
                              time: MessageController
                                  .instance.messageModel.data![i].createdAt!,
                              sender: MessageController
                                  .instance.messageModel.data![i].phoneNo!,
                              slot: MessageController
                                  .instance.messageModel.data![i].imei
                                  .toString(),
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
