import 'dart:convert';

class User {
  String? name;
  String? password;
  String? email;
  String? age;
  String? id;

  User(
      {required this.name,
      required this.password,
      required this.email,
      required this.age,
      this.id});

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        password: json['password'],
        email: json['email'],
        age: json['age'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
        'email': email,
        'age': age,
        'id': id
      };
}

List<User> userFromJson(String userString) => List<User>.from(
      json.decode(userString).map(
            (element) => User.fromJson(element),
          ),
    );

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));
