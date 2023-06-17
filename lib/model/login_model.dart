// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  int status;
  String message;
  Data data;
  List<dynamic> validationMessage;
  dynamic errorMessage;

  LoginModel({
    required this.status,
    required this.message,
    required this.data,
    required this.validationMessage,
    this.errorMessage,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["Status"],
        message: json["Message"],
        data: Data.fromJson(json["Data"]),
        validationMessage:
            List<dynamic>.from(json["ValidationMessage"].map((x) => x)),
        errorMessage: json["ErrorMessage"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Data": data.toJson(),
        "ValidationMessage":
            List<dynamic>.from(validationMessage.map((x) => x)),
        "ErrorMessage": errorMessage,
      };
}

class Data {
  String customerGuid;
  String userName;
  String emailId;
  String message;
  bool isValid;
  bool rememberMe;
  int customerId;

  Data({
    required this.customerGuid,
    required this.userName,
    required this.emailId,
    required this.message,
    required this.isValid,
    required this.rememberMe,
    required this.customerId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerGuid: json["CustomerGuid"],
        userName: json["UserName"],
        emailId: json["EmailId"],
        message: json["Message"],
        isValid: json["IsValid"],
        rememberMe: json["RememberMe"],
        customerId: json["CustomerId"],
      );

  Map<String, dynamic> toJson() => {
        "CustomerGuid": customerGuid,
        "UserName": userName,
        "EmailId": emailId,
        "Message": message,
        "IsValid": isValid,
        "RememberMe": rememberMe,
        "CustomerId": customerId,
      };
}
