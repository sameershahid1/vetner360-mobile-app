import 'package:vetner360/controller/sell_pet_dialog_controller.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPetDialog extends StatelessWidget {
  const SellPetDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SellPetDialogController>(
      init: SellPetDialogController(),
      dispose: (_) {
        Get.delete<SellPetDialogController>();
      },
      builder: (_) => AlertDialog(
        title: Row(
          children: [
            Text(
              'Select pet to sell',
              style: isemibold.copyWith(fontWeight: FontWeight.w600),
            ),
            Spacer(),
            GestureDetector(
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              onTapDown: (TapDownDetails data) {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        content: Obx(() => _.sellDialogPages[_.selectedPageIndex.value]),
      ),
    );
  }
}
