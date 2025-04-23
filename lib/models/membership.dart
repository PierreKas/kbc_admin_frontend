class Membership {
  int? id;
  String names;
  DateTime? dateOfBirth;
  String placeOfBirth;
  String nationality;
  String gender;
  String residence;
  String maritalStatus;
  String educationLevel;
  String profession;
  String email;
  DateTime? joiningKbcDate;
  String phoneNumber;
  String? password;
  bool baptized;
  bool hasCompletedClasses;

  Membership({
    this.id,
    required this.names,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.placeOfBirth,
    required this.nationality,
    required this.gender,
    required this.residence,
    required this.maritalStatus,
    required this.educationLevel,
    required this.profession,
    required this.joiningKbcDate,
    required this.password,
    required this.email,
    required this.hasCompletedClasses,
    required this.baptized,
  });

  factory Membership.fromJson(Map<String, dynamic> json) {
    return Membership(
      names: json['names'],
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      placeOfBirth: json['placeOfBirth'],
      nationality: json['nationality'],
      gender: json['gender'],
      residence: json['residence'],
      maritalStatus: json['maritalStatus'],
      educationLevel: json['educationLevel'],
      profession: json['profession'],
      joiningKbcDate: json['joiningKbcDate'] != null
          ? DateTime.parse(json['joiningKbcDate'])
          : null,
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      password: json['password'],
      id: json['id'],
      baptized: json['baptized'],
      hasCompletedClasses: json['hasCompletedClasses'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'names': names,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'placeOfBirth': placeOfBirth,
      'nationality': nationality,
      'gender': gender,
      'residence': residence,
      'maritalStatus': maritalStatus,
      'educationLevel': educationLevel,
      'profession': profession,
      'joiningKbcDate': joiningKbcDate?.toIso8601String(),
      'phoneNumber': phoneNumber,
      'password': password,
      'email': email,
      'id': id,
      'hasCompletedClasses': hasCompletedClasses,
      'baptized': baptized,
    };
  }
}
