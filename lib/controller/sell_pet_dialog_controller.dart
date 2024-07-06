import 'package:get/get.dart';
import 'package:vetner360/component/dialog/sell_pet_form.dart';
import 'package:vetner360/component/dialog/sell_pet_select_content.dart';

class SellPetDialogController extends GetxController {
  RxInt selectedPageIndex = 0.obs;
  RxString petId = "".obs;
  final sellDialogPages = [
    SellPetSelectContent(),
    SellPetForm(),
  ];
}
