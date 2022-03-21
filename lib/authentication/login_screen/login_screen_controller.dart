import 'package:e_commerce_app/authentication/otp_verification_screen/otp_screen_view.dart';
import 'package:e_commerce_app/const/const.dart';
import 'package:e_commerce_app/home_screen/home_screen_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController phone = TextEditingController();
  final TextEditingController otp = TextEditingController();
  late String verificationId;
  bool isLoading = false;

  void verifyPhoneNumber() async {
    isLoading = true;

    update();
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "+92${phone.text}",
          verificationCompleted: (PhoneAuthCredential credential) async {
            await _auth.signInWithCredential(credential);
            showAlert("Verified");
          },
          verificationFailed: (FirebaseAuthException exception) async {
            showAlert("Verification Failed");
          },
          codeSent: (String _verificationId, int? forceRespondToken) {
            showAlert("Verification Code Sent");
            verificationId = _verificationId;
            Get.to(OtpVerificationScreen());
          },
          codeAutoRetrievalTimeout: (String _verificationId) {
            verificationId = _verificationId;
          });
    } catch (e) {
      showAlert("Error Occured: $e ");
    }
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp.text);

      var signInUser = await _auth.signInWithCredential(credential);

      final User? user = signInUser.user;

      showAlert("Sign In Successfully User UID :${user!.uid} ");

      Get.to(HomeScreen());

      print("Sign In Successfully User UID :${user.uid} ");
    } catch (e) {
      showAlert("Error Occured: $e ");
    }
  }
}
