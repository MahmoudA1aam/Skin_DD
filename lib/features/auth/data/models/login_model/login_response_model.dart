class LoginResponseModel {
  String? accessToken;
  User? user;
  String? message;

  LoginResponseModel({this.accessToken, this.user, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? birthdate;
  String? profileImage;
  String? createdAt;

  User({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.birthdate,
    this.profileImage,
    this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    birthdate = (json['birthdate'] as String?) ?? "";
    profileImage = (json['profile_image'] as String?) ?? "";
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['birthdate'] = this.birthdate;
    data['profile_image'] = this.profileImage;
    data['created_at'] = this.createdAt;
    return data;
  }
}
