class SignUpModel {
  final String email;
  final String password;

  final String name;

  SignUpModel({
    required this.email,
    required this.password,
    required this.name,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      email: json['email'],
      password: json['password'],

      name: json['name'],
    );
  }
  toJson() {
    return {'email': email, 'password': password, 'name': name};
  }
}
