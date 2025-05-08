class SignUpRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? birthdate;
  String? profileImage;
  String? password;

  SignUpRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.birthdate,
    this.profileImage,
    this.password,
  });

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    birthdate = json['birthdate'];
    profileImage = json['profile_image'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['birthdate'] = this.birthdate;
    data['profile_image'] = this.profileImage;
    data['password'] = this.password;
    return data;
  }
}
