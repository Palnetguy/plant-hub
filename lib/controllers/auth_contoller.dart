import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:plant_scan/constants/const.dart';
import 'package:plant_scan/screens/homeScreen.dart';
import 'package:plant_scan/screens/loginScreen.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool nameError = false;
  bool emailError = false;
  bool phoneNumberError = false;
  bool passwordError = false;

  bool isValidFullName = false;
  bool isValidEmail = false;
  bool isValidPhoneNumber = false;
  bool isValidPassword = false;

  String nameErrorText = '';
  String emailErrorText = '';
  String phoneNumberErrorText = '';
  String passwordErrorText = '';

  int currentStep = 0;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // user is null or user is not available or not logged in
      Get.offAll(() => const LoginScreen());
    } else {
      // user is logged in
      Get.offAll(() => const HomeScreen());
    }
  }

  void register() async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      goToNext(1);
    } on FirebaseAuthException catch (e) {
      // this is solely for the Firebase Auth Exception
      // for example : password did not match
      print(e.message);
      // Get.snackbar("Error", e.message!);
      Get.snackbar(
        "Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: errorColor,
      );
    } catch (e) {
      // this is temporary. you can handle different kinds of activities
      //such as dialogue to indicate what's wrong
      print(e.toString());
    }
  }

  Future<void> verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!
        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  void login() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email.text, password: password.text);
      Get.to(() => const HomeScreen());
    } on FirebaseAuthException catch (e) {
      // for example : password did not match
      print(e.message);
      Get.snackbar(
        "Login Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: errorColor,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      auth.signOut();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      print(e.toString());
    }
  }

  void goToNext(int nextstep) {
    currentStep = nextstep;
    update();
  }

  // check password
  void isValidPasswordFunc() {
    if ((password.text == confirmPassword.text) &&
            (password.text.length >= 6) ||
        (confirmPassword.text.length >= 6)) {
      isValidPassword = true;
      passwordError = false;
    } else if ((password.text.length <= 6) ||
        (confirmPassword.text.length <= 6)) {
      passwordError = true;
      passwordErrorText = "Password must length be greater than 6 characters";
    } else if (password != confirmPassword) {
      passwordError = true;
      passwordErrorText = "Password must same as confrim password";
    } else {
      passwordError = true;
      passwordErrorText = "Enter valid Password";
    }
    update();
  }

  // valid email
  void isValidEmailFunc() {
    // Regular expression for email validation
    // This regex is a basic one and might not cover all cases
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (emailRegex.hasMatch(email.text)) {
      isValidEmail = true;
      emailError = false;
    } else {
      emailError = true;
      emailErrorText = "Enter Valid Email address";
    }
    update();
  }

  // valid Name
  void isValidNameFunc() {
    final RegExp nameRegex =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    if (nameRegex.hasMatch(name.text) && name.text.isNotEmpty) {
      isValidFullName = true;
      nameError = false;
    } else {
      nameError = true;
      nameErrorText = "Please Enter your Full name";
    }
    update();
  }

// validate number
  void isValidPhoneNumberFunc() {
    // Regular expression for basic phone number validation
    // This regex allows for phone numbers with optional country code and area code
    final RegExp phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    // return phoneRegex.hasMatch(phoneNumber);
    if (phoneRegex.hasMatch(phoneNumber.text)) {
      isValidPhoneNumber = true;
      phoneNumberError = false;
    } else {
      phoneNumberError = true;
      phoneNumberErrorText = "Enter Valid Phone Number";
    }
    update();
  }

// check the whole thing
  bool isValidToCreateAccount() {
    return isValidFullName && isValidEmail && isValidPassword;
  }

  bool isValidToLogIn() {
    return isValidEmail && password.text.isNotEmpty;
  }

  @override
  void dispose() {
    nameError = false;
    emailError = false;
    phoneNumberError = false;
    passwordError = false;

    isValidEmail = false;
    isValidPhoneNumber = false;
    isValidPassword = false;

    nameErrorText = '';
    emailErrorText = '';
    phoneNumberErrorText = '';
    passwordErrorText = '';
    update();
    super.dispose();
  }

  setInputValuesDefault() {
    name.clear();
    email.clear();
    phoneNumber.clear();
    password.clear();
    confirmPassword.clear();

    nameError = false;
    emailError = false;
    phoneNumberError = false;
    passwordError = false;

    isValidEmail = false;
    isValidPhoneNumber = false;
    isValidPassword = false;

    nameErrorText = '';
    emailErrorText = '';
    phoneNumberErrorText = '';
    passwordErrorText = '';
    update();
  }
}
