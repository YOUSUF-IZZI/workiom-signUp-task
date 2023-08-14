import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// ---------- Email provider ----------
final emailTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());
// ---------- Password provider ----------
final passwordTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());
// ---------- Workspace provider ----------
final workspaceTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());
// ---------- FirstName provider ----------
final firstNameTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());
// ---------- LastName provider  ----------
final lastNameTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());


// ---------- App Current language provider ----------
final currentLanguageProvider = StateProvider.autoDispose<String>((ref) {
  return 'English';
});


// ---------- is obscureText ----------
final isObscureTextProvider = StateProvider.autoDispose<bool>((ref) {
  return true;
});
// ---------- Linear progress indicator counter ----------
final indicatorCounterProvider = StateProvider.autoDispose<double>((ref) {
  return 0.0;
});
// ---------- Password length checker ----------
final passwordLengthCheckerProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
// ---------- Password uppercase checker ----------
final passwordUppercaseCheckerProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});


// ---------- is tenant available ----------
final isTenantAvailableProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});


// ------------------------------ Validation providers ------------------------------
final isStepTwoValidProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});
final isStepThreeValidProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});


// ---------- after registering the new user directly ----------
final isCircularProgressIndicatorLoading = StateProvider<bool>((ref) => false);


// ---------- Authentication providers ----------
final accessTokenProvider = StateProvider<String>((ref) {
  return '';
});
final isAuth = StateProvider<bool>((ref) {
  return false;
});

