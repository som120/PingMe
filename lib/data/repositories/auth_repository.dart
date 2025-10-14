import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pingme/data/models/user_model.dart';
import 'package:pingme/data/services/base_repository.dart';

class AuthRepository extends BaseRepository {
  Future<UserModel> signUp({
    required String fullName,
    required String username,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        throw "User not found";
      }
      // create user model and save to firestore
      final user = UserModel(
        uid: userCredential.user!.uid,
        username: username,
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
      );
      await saveUserData(user);
      return user;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> saveUserData(UserModel user) async {
    try {
      await firestore.collection("users").doc(user.uid).set(user.toMap());
    } catch (e) {
      throw "Failed to save user data";
    }
  }
}
