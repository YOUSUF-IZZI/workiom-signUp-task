import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ---------- SignUp form ----------
final signUpFormProvider = Provider.autoDispose<FormGroup>((ref) {
  return FormGroup({
    'email' : FormControl<String>(validators: [Validators.required, Validators.email, ]),
    'password' : FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(7),
      Validators.pattern(r'^(?=.*?[A-Z])', validationMessage: 'Password must have at least one uppercase letter'),
    ]),
    'workspaceName': FormControl<String>(validators: [
      Validators.required,
      Validators.pattern(r'^[a-zA-Z].*', validationMessage: 'must start with a letter only')
    ]),
    'firstName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z]+$', validationMessage: ' first name should be Letters only') ]),
    'lastName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z]+$', validationMessage: ' last name should be Letters only') ]),
  });
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

