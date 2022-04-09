import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) =>
    List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
  LoginModel({
    required this.userid,
    required this.username,
    required this.password,
    required this.email,
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.birthday,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.address,
    required this.career,
  });

  String userid;
  String username;
  String password;
  String email;
  String phone;
  String firstname;
  String lastname;
  String birthday;
  String age;
  String gender;
  String height;
  String weight;
  String address;
  String career;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        userid: json["userid"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        phone: json["phone"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        birthday: json["birthday"],
        age: json["age"],
        gender: json["gender"],
        height: json["height"],
        weight: json["weight"],
        address: json["address"],
        career: json["career"],
      );

  Map<String, dynamic> toJson() => {
        "userid": userid,
        "username": username,
        "password": password,
        "email": email,
        "phone": phone,
        "firstname": firstname,
        "lastname": lastname,
        "birthday": birthday,
        "age": age,
        "gender": gender,
        "height": height,
        "weight": weight,
        "address": address,
        "career": career,
      };
}
