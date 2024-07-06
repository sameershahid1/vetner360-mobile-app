import 'package:vetner360/utils/type/pet_sell_type.dart';

class PetSellResponseType {
  late List<PetSellType> records;
  late String message;
  late PetSellType? data;
  late bool status;
  late int count;

  PetSellResponseType({
    required this.records,
    required this.message,
    required this.status,
    required this.data,
    required this.count,
  });
}
