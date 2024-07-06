class PetType {
  final String id;
  final String name;
  final String nickName;
  final String gender;
  final String birthDate;
  final String type;
  final String imagePath;
  final String breed;
  final String note;
  final String weight;
  final String dietPlan;
  final bool vaccinated;
  final List<String> tags;
  final String userId;
  final String token;
  final String createdAt;

  PetType({
    required this.id,
    required this.name,
    required this.nickName,
    required this.gender,
    required this.birthDate,
    required this.type,
    required this.imagePath,
    required this.breed,
    required this.note,
    required this.weight,
    required this.dietPlan,
    required this.vaccinated,
    required this.tags,
    required this.userId,
    required this.token,
    required this.createdAt,
  });
}
