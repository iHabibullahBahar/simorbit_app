import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simorbit_app/src/consts/sizes.dart';

class AddNewSlotWidget extends StatelessWidget {
  const AddNewSlotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: Get.width - 2 * zDefaultPadding,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
