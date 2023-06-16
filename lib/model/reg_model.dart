// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) =>
    RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) =>
    json.encode(data.toJson());

class RegistrationModel {
  int status;
  String message;
  Data data;
  List<dynamic> validationMessage;
  dynamic errorMessage;

  RegistrationModel({
    required this.status,
    required this.message,
    required this.data,
    required this.validationMessage,
    this.errorMessage,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      RegistrationModel(
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
  bool isValidRegistration;
  int customerId;
  dynamic adminComment;
  bool active;
  int affiliateId;
  dynamic billingAddress;
  dynamic cannotLoginUntilDateUtc;
  DateTime createdOnUtc;
  String customerGuid;
  bool deleted;
  String email;
  dynamic emailToRevalidate;
  int failedLoginAttempts;
  bool hasShoppingCartItems;
  bool isSystemAccount;
  bool isTaxExempt;
  DateTime lastActivityDateUtc;
  dynamic lastIpAddress;
  dynamic lastLoginDateUtc;
  int registeredInStoreId;
  bool requireReLogin;
  dynamic shippingAddress;
  dynamic systemName;
  String username;
  int vendorId;
  String message;

  Data({
    required this.isValidRegistration,
    required this.customerId,
    this.adminComment,
    required this.active,
    required this.affiliateId,
    this.billingAddress,
    this.cannotLoginUntilDateUtc,
    required this.createdOnUtc,
    required this.customerGuid,
    required this.deleted,
    required this.email,
    this.emailToRevalidate,
    required this.failedLoginAttempts,
    required this.hasShoppingCartItems,
    required this.isSystemAccount,
    required this.isTaxExempt,
    required this.lastActivityDateUtc,
    this.lastIpAddress,
    this.lastLoginDateUtc,
    required this.registeredInStoreId,
    required this.requireReLogin,
    this.shippingAddress,
    this.systemName,
    required this.username,
    required this.vendorId,
    required this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        isValidRegistration: json["IsValidRegistration"],
        customerId: json["CustomerId"],
        adminComment: json["AdminComment"],
        active: json["Active"],
        affiliateId: json["AffiliateId"],
        billingAddress: json["BillingAddress"],
        cannotLoginUntilDateUtc: json["CannotLoginUntilDateUtc"],
        createdOnUtc: DateTime.parse(json["CreatedOnUtc"]),
        customerGuid: json["CustomerGuid"],
        deleted: json["Deleted"],
        email: json["Email"],
        emailToRevalidate: json["EmailToRevalidate"],
        failedLoginAttempts: json["FailedLoginAttempts"],
        hasShoppingCartItems: json["HasShoppingCartItems"],
        isSystemAccount: json["IsSystemAccount"],
        isTaxExempt: json["IsTaxExempt"],
        lastActivityDateUtc: DateTime.parse(json["LastActivityDateUtc"]),
        lastIpAddress: json["LastIpAddress"],
        lastLoginDateUtc: json["LastLoginDateUtc"],
        registeredInStoreId: json["RegisteredInStoreId"],
        requireReLogin: json["RequireReLogin"],
        shippingAddress: json["ShippingAddress"],
        systemName: json["SystemName"],
        username: json["Username"],
        vendorId: json["VendorId"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "IsValidRegistration": isValidRegistration,
        "CustomerId": customerId,
        "AdminComment": adminComment,
        "Active": active,
        "AffiliateId": affiliateId,
        "BillingAddress": billingAddress,
        "CannotLoginUntilDateUtc": cannotLoginUntilDateUtc,
        "CreatedOnUtc": createdOnUtc.toIso8601String(),
        "CustomerGuid": customerGuid,
        "Deleted": deleted,
        "Email": email,
        "EmailToRevalidate": emailToRevalidate,
        "FailedLoginAttempts": failedLoginAttempts,
        "HasShoppingCartItems": hasShoppingCartItems,
        "IsSystemAccount": isSystemAccount,
        "IsTaxExempt": isTaxExempt,
        "LastActivityDateUtc": lastActivityDateUtc.toIso8601String(),
        "LastIpAddress": lastIpAddress,
        "LastLoginDateUtc": lastLoginDateUtc,
        "RegisteredInStoreId": registeredInStoreId,
        "RequireReLogin": requireReLogin,
        "ShippingAddress": shippingAddress,
        "SystemName": systemName,
        "Username": username,
        "VendorId": vendorId,
        "Message": message,
      };
}
