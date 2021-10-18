import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:getx_firebase_todo_app/core/services/firestore_user.dart';
import 'package:getx_firebase_todo_app/model/user_model.dart';
import 'package:getx_firebase_todo_app/view/home_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;

  FacebookLogin _facebookLogin = FacebookLogin();

  String email, password, name;
// Rx<User> user = Rx<User>(); will give an error
  Rxn<User> _user = Rxn<User>();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String get user => _user.value?.email;

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    /*This will give you all the details that the user has uploaded on their
    google account eg: emailId, photoUrl, phoneNumber...*/

    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(HomeView());
    });
  }

  void facebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.loggedIn) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential).then((user) {
        saveUser(user);
        Get.offAll(HomeView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        "Error Loggin In",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
      );
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) {
        saveUser(user);
      });
      Get.offAll(HomeView());
    } catch (e) {
      print(e.message);
      Get.snackbar(
        "Error Loggin In",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
      );
    }
  }

  void saveUser(UserCredential user) async {
    await FirestoreUser().addUserToFirestore(UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    ));
  }
}
