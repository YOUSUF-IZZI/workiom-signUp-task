import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';


// ---------- SignUp form ----------
final signUpFormProvider = Provider<FormGroup>((ref) {
  return FormGroup({
    'email' : FormControl<String>(validators: [Validators.required, Validators.email, Validators.requiredTrue ]),
    'password' : FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(7),
      Validators.pattern(r'^(?=.*?[A-Z])', validationMessage: 'Password must have at least one uppercase letter'),
    ]),
    'workspaceName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z].*', validationMessage: 'must start with a letter only')]),
    'firstName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z]+$', validationMessage: ' first name should be Letters only') ]),
    'lastName': FormControl<String>(validators: [Validators.required, Validators.pattern(r'^[a-zA-Z]+$', validationMessage: ' last name should be Letters only') ]),
  });
});

// ---------- is obscureText ----------
final isObscureTextProvider = StateProvider<bool>((ref) {
  return true;
});

// ---------- Linear progress indicator counter ----------
final indicatorCounterProvider = StateProvider<double>((ref) {
  return 0.0;
});

// ---------- Password length checker ----------
final passwordLengthCheckerProvider = StateProvider<bool>((ref) {
  return false;
});

// ---------- Password upercase checker ----------
final passwordUpercaseCheckerProvider = StateProvider<bool>((ref) {
  return false;
});

// ---------- is password Strong checker ----------
final isPasswordStrongProvider = StateProvider<bool>((ref) {
  return false;
});

// ---------- is tenant available ----------
final isTenantAvailableProvider = StateProvider<bool>((ref) {
  return false;
});

// ---------- language provider ----------
final languageProvider = StateProvider.autoDispose<String>((ref) {
  return 'English';
});

// ---------- language provider ----------
final isStepTwoValidProvider = StateProvider<bool>((ref) {
  return false;
});

// ---------- language provider ----------
final isStepThreeValidProvider = StateProvider<bool>((ref) {
  return false;
});




/*
// ---------- manage the user's authentication state. ----------
final authProvider  = StateProvider<bool>((ref) {
  return false;
});

// ---------- Check Authentication Status ----------
final authStatusProvider = FutureProvider<bool>((ref) async {
  ApiServices apiServices = ApiServices() ;
  bool isLoggedIn = await apiServices.getCurrentLoginInformations();
  return isLoggedIn;
});*/
