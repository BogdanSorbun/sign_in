import 'dart:async';
//import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

//A normal constructor always returns a new instance of the current class
//this class will get imported into signup/signin page to fill the information
//out within the constructor
class UserData {
//  fields
  String displayName;
  String email;
  String uid;
  String password;
  String confirmPassword;

//  setter/getter?
  UserData({this.displayName, this.email, this.uid, this.password});
}

class UserAuth {
  String statusMessage = "Account has been created";
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//  to create a new user
//  Future is used for asynchronous operations - processing or I/O to be
//  completed later.  So basically it performs other work while waiting for
//  an opteration to finish.
  Future<String> createUser(UserData userData) async{
    await firebaseAuth.
    createUserWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return statusMessage;
//    user.sendEmailVerification();
//    assert(user != null);
//    assert(await user.getIdToken() != null);
//    return user;
  }

//  to verify the new user
  Future<String> verifyUser(UserData userData) async{
    await firebaseAuth
        .signInWithEmailAndPassword(
        email: userData.email, password: userData.password);
    return "login Successful";
  }

  Future<FirebaseUser> getCurrentUser() async {
    var user = await firebaseAuth.currentUser();
    return user;
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<void> signOut() async {
    return firebaseAuth.signOut();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

}
//
//abstract class BaseAuth {
//  Future<String> signIn(String email, String password);
//  Future<String> signUp(String email, String password);
////  Future<FirebaseUser> getCurrentUser();
//  Future<void> sendEmailVerification();
//  Future<void> signOut();
//  Future<bool> isEmailVerified();
//}
//
//class Auth {
//  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
////  trying some combinations here
//  signIn(String email, String password) async {
//    FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(
//        email: email, password: password);
//    return user.uid;
//  }
//
//  Future<String> signUp(String email, String password) async {
//    FirebaseUser user = await _firebaseAuth.createUserWithEmailAndPassword(
//        email: email, password: password);
//    return user.uid;
//  }
//
////  Future<FirebaseUser> getCurrentUser() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    return user;
////  }
//
////  Future<void> signOut() async {
////    return _firebaseAuth.signOut();
////  }
//
////  Future<void> sendEmailVerification() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    user.sendEmailVerification();
////  }
////
////  Future<bool> isEmailVerified() async {
////    FirebaseUser user = await _firebaseAuth.currentUser();
////    return user.isEmailVerified;
////  }


