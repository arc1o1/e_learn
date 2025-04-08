class User {
  final int id;
  final String email;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? phoneNumber;
  final String? schoolName;
  final String? classLevel;
  final String? nidaId;
  final String? taiId;

  User(
      {required this.id,
      required this.email,
      required this.username,
      this.firstName,
      this.lastName,
      this.role,
      this.phoneNumber,
      this.schoolName,
      this.classLevel,
      this.nidaId,
      this.taiId});

  factory User.empty() => User(id: 0, email: "", username: "");

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      role: json['role'],
      phoneNumber: json['phone_number'],
      schoolName: json['school_name'],
      classLevel: json['class_level'],
      nidaId: json['nida_id'],
      taiId: json['tai_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'phone_number': phoneNumber,
      'school_name': schoolName,
      'class_level': classLevel,
      'nida_id': nidaId,
      'tai_id': taiId,
    };
  }
}
