import 'package:vetner360/utils/type/pet_type,.dart';

class PetSellType {
  late String id;
  late String userId;
  late String petId;
  late double price;
  late String contactNo;
  late PetType petDetail;
  late String token;
  late String created_at;

  PetSellType({
    required this.id,
    required this.userId,
    required this.petId,
    required this.price,
    required this.contactNo,
    required this.petDetail,
    required this.token,
    required this.created_at,
  });
}
