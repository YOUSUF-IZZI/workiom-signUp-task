import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';


// -------------------- SignUp forms and Text Editing Controllers --------------------
final signUpFormProvider = Provider.autoDispose<FormGroup>((ref) {
  return FormGroup({
    'workspaceName': FormControl<String>(validators: [
      Validators.required,
      Validators.pattern(r'^[a-zA-Z].*', validationMessage: 'must start with a letter only')
    ]),
    'firstName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z]+$', validationMessage: ' first name should be Letters only') ]),
    'lastName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z]+$', validationMessage: ' last name should be Letters only') ]),
  });
});


// ---------- Email provider ----------
final emailTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());
// ---------- Password provider ----------
final passwordTextEditingControllerProvider = Provider.autoDispose<TextEditingController>((ref) => TextEditingController());



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

// ---------- is password Strong checker ----------
final isPasswordStrongProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// ---------- is tenant available ----------
final isTenantAvailableProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// ---------- language provider ----------
final currentLanguageProvider = StateProvider.autoDispose<String>((ref) {
  return 'English';
});

// ---------- language provider ----------
final isStepTwoValidProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// ---------- language provider ----------
final isStepThreeValidProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});

// ---------- language provider ----------
final accessTokenProvider = StateProvider<String>((ref) {
  return '';
});

