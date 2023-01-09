import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userModelFromJson(String str) =>
    UserModel.fromDocument(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toDocumentSnapshot());

class UserModel {
  String? uid;
  String? email;
  String? password;

  UserModel({
    this.uid,
    this.email,
    this.password,
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
      uid: doc['uid'],
      email: doc['email'],
      password: doc['password'],
    );
  }

  Map<String, dynamic> toDocumentSnapshot() {
    return {
      'uid': uid,
      'email': email,
      'password': password,
    };
  }

  // json decode

}
