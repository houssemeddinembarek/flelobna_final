class User {
  String? email;
  String? firstName;
  String? lastName;

  User({
    this.email,
    this.firstName,
    this.lastName,
  });

  Map<String, dynamic> toJson() {
    return {'email': email, 'firstName': firstName, 'lastName': lastName};
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
