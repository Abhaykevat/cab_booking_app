/// widgets/loading_bar.dart
import 'package:cab_booking_app/src/common_widgets/loading_bar/controller/loading_bar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingBar extends StatelessWidget {
  LoadingBar({Key? key}) : super(key: key);

  final LoadingController controller = Get.put(LoadingController());

  Widget buildDot(int index, int activeIndex) {
    final colors = [
      Colors.green.withOpacity(0.3),
      Colors.green.withOpacity(0.5),
      Colors.green.withOpacity(0.7),
      Colors.green,
    ];

    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 30,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: activeIndex >= index
            ? colors[index]
            : Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.2)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final index = controller.activeIndex.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(4, (i) => buildDot(i, index)),
      );
    });
  }
}
