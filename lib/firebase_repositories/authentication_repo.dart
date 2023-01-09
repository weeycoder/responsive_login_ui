import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signin_ui/helpers/shared_preferences.dart';
import 'package:login_signin_ui/models/user_model.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> createUser(UserModel user) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      UserSharedPreferences.setErrorMsg(e.toString().split(']')[1]);
      return Future.value(false);
    }
  }

  Future<void> addUserToFireStore(UserModel user) async {
    try {
      await _fireStore.collection('users').add({
        'uid': user.uid,
        'email': user.email,
        'password': user.password,
      });
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
    }
  }
}
