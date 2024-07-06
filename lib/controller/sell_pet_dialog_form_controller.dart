import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/utils/helping/pet_sell_request.dart';
import 'package:vetner360/controller/sell_pet_dialog_controller.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPetDialogFormController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final priceController = TextEditingController();
  final contactNoController = TextEditingController();
  final themedata = Get.put(DoctorThemecontroler());

  Future<void> submitForm(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        final sellPetController = Get.find<SellPetDialogController>();
        final String petId = sellPetController.petId.value;
        Color messageColor = Colors.green;
        final response = await PetSellRequest.postingPetOnSell(
            petId, priceController.text, contactNoController.text, context);
        if (!(response["status"] != null)) {
          messageColor = Colors.red;
        } else {
          sellPetController.selectedPageIndex.value = 0;
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response['message']),
          backgroundColor: messageColor,
        ));
      }
    } catch (error) {
      print("error: $error");
    }
  }
}
