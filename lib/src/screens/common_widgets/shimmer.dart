import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simorbit_app/src/consts/colors.dart';

class ShimmerEffectCardWidget extends StatelessWidget {
  double width;
  double height;
  double radius;
  double verticalPadding;
  ShimmerEffectCardWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.verticalPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Shimmer.fromColors(
        baseColor: zGraySwatch[50]!,
        highlightColor: zGraySwatch[100]!,
        period: const Duration(milliseconds: 1500),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: zGraySwatch[50]!,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
      ),
    );
  }
}
