import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';


// ---------- SignUp form ----------
final signUpFormProvider = Provider.autoDispose<FormGroup>((ref) {
  return FormGroup({
    'email' : FormControl<String>(validators: [Validators.required, Validators.email]),
    'password' : FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(7),
      Validators.pattern(r'^(?=.*?[A-Z])', validationMessage: 'Password must have at least one uppercase letter'),
    ]),
    'workspaceName': FormControl<String>(validators: [Validators.required ]),
    'firstName': FormControl<String>(validators: [Validators.required ]),
    'lastName': FormControl<String>(validators: [Validators.required ]),
  });
});

// ---------- is obscureText ----------
final isObscureTextProvider = StateProvider.autoDispose<bool>((ref) {
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