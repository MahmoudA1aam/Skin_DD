class LoginModel {
  final String email;
  final String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(email: json['email'], password: json['password']);
  }
  toJson() {
    return {'email': email, 'password': password};
  }
}
