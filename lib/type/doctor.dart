class Location {
  late String type;
  late List<double> coordinates;

  Location(this.type, this.coordinates);
}

class Doctor {
  late String id;
  late String firstName;
  late String lastName;
  late String email;
  late String phoneNumber;
  late String password;
  late String roleId;
  late String token;
  late String created_at;
  late String fatherName;
  late String registration;
  late String clinicName;
  late Location location;
  // late String bio;

  Doctor(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.password,
    this.roleId,
    this.token,
    this.created_at,
    this.fatherName,
    this.registration,
    this.clinicName,
    this.location,
    // this.bio,
  );
}
