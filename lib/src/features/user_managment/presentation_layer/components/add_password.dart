import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../state_managment/riverpod.dart';


class AddPasswordComponent extends ConsumerWidget {
  const AddPasswordComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = ref.watch(isObscureTextProvider);
    final signUpForm = ref.watch(signUpFormProvider);
    return ReactiveForm(
      formGroup: ref.watch(signUpFormProvider),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your password', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Image.asset('assets/icons/user_managment/lock.png', width: 18.w,),
              SizedBox(width: 8.w,),
              Expanded(
                child: ReactiveTextField(
                  onChanged: (value){
                    // Conditions of Linear progress indicator counter provider
                    if ((signUpForm.control('email').valid == true) && (signUpForm.control('password').valid == true)) {
                      ref.read(indicatorCounterProvider.notifier).state= 1.0;
                      ref.read(isPasswordStrongProvider.notifier).state = true;
                    }
                    else if ((signUpForm.control('email').valid == true) && (signUpForm.control('password').valid == false)) {
                      ref.read(indicatorCounterProvider.notifier).state= 0.5; }
                    else if ((signUpForm.control('email').valid == false) && (signUpForm.control('password').valid == true)) {
                      ref.read(indicatorCounterProvider.notifier).state= 0.5;
                      ref.read(isPasswordStrongProvider.notifier).state = true;
                    }
                    else {
                      ref.read(indicatorCounterProvider.notifier).state= 0.0;
                      ref.read(isPasswordStrongProvider.notifier).state = false;
                    }
                    // Conditions of Password length checker provider & Password upercase checker provider
                    if (signUpForm.control('password').value.toString().length < 7) {
                      ref.read(passwordLengthCheckerProvider.notifier).state = false;
                    }  else {
                      ref.read(passwordLengthCheckerProvider.notifier).state = true;
                    }
                    // Conditions of Password upercase checker provider
                    if (signUpForm.control('password').value.toString().runes.any((rune) => rune >= 65 && rune <= 90)) {
                      ref.read(passwordUpercaseCheckerProvider.notifier).state = true;
                    }  else {
                      ref.read(passwordUpercaseCheckerProvider.notifier).state = false;
                    }

                  },
                  obscureText: isObscure,
                  obscuringCharacter: '*',
                  formControlName: 'password',
                  decoration: InputDecoration(
                    hintText: 'Password',
                    suffixIcon: GestureDetector(
                        onTap: (){
                          ref.read(isObscureTextProvider.notifier).state = !isObscure;
                        },
                        child: Image.asset('assets/icons/user_managment/eye_password.png', scale: 1.5, color: isObscure == false ? Colors.red : const Color(0xFF747474),)),
                    contentPadding: EdgeInsets.only(top: 15, bottom: 13.h),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
