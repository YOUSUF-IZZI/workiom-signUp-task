import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../state_managment/riverpod.dart';


class AddPasswordComponent extends ConsumerWidget {
  const AddPasswordComponent({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isObscure = ref.watch(isObscureTextProvider);
    final passwordController = ref.watch(passwordTextEditingControllerProvider);
    final emailController = ref.watch(emailTextEditingControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your password', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
        SizedBox(height: 15.h,),
        Row(
          children: [
            Image.asset('assets/icons/user_managment/lock.png', width: 18.w,),
            SizedBox(width: 8.w,),
            Expanded(
              child: TextFormField(
                controller: passwordController,
                obscureText: isObscure,
                obscuringCharacter: '*',
                onChanged: (text) {
                  // Validation of step 2
                  if ( (emailController.text.isNotEmpty == true) && (RegExp(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$').hasMatch(emailController.text) == true) && (passwordController.text.length >= 7) && (passwordController.text.contains(RegExp(r'[A-Z]'))) ) {
                    ref.read(isStepTwoValidProvider.notifier).state = true;
                  } else {
                    ref.read(isStepTwoValidProvider.notifier).state = false;
                  }
                  // Setting Password Length Checker
                  if (text.length >= 7) {
                    ref.read(passwordLengthCheckerProvider.notifier).state = true;
                  }  else {
                    ref.read(passwordLengthCheckerProvider.notifier).state = false;
                  }
                  // Setting Password Uppercase Checker
                  if (passwordController.text.contains(RegExp(r'[A-Z]'))) {
                    ref.read(passwordUppercaseCheckerProvider.notifier).state = true;
                  }  else {
                    ref.read(passwordUppercaseCheckerProvider.notifier).state = false;
                  }

                  // Password Strength Checker
                  final RegExp numReg = RegExp(r".*[0-9].*");
                  final RegExp capitalLetterReg = RegExp(r".*[A-Z].*");
                  final RegExp smallLetterReg = RegExp(r".*[a-z].*");
                  final RegExp charReg = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                  if (passwordController.text.isEmpty) {
                    ref.read(indicatorCounterProvider.notifier).state = 0;
                  } else if (passwordController.text.length < 4) {
                    ref.read(indicatorCounterProvider.notifier).state = 1/8;
                  } else if (passwordController.text.length < 6) {
                    ref.read(indicatorCounterProvider.notifier).state = 1/4;
                  }  else if (passwordController.text.length < 8) {
                    ref.read(indicatorCounterProvider.notifier).state = 2/4;
                  }
                  else {
                    if (!capitalLetterReg.hasMatch(passwordController.text.trim()) || !smallLetterReg.hasMatch(passwordController.text.trim()) || !charReg.hasMatch(passwordController.text.trim()) || !numReg.hasMatch(passwordController.text.trim())) {
                      ref.read(indicatorCounterProvider.notifier).state = 3/4;
                    }  else {
                      ref.read(indicatorCounterProvider.notifier).state = 1;
                    }
                  }
                },

                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: GestureDetector(
                      onTap: (){
                        ref.read(isObscureTextProvider.notifier).state = !isObscure;
                      },
                      child: Image.asset(isObscure ? 'assets/icons/user_managment/enable_eye.png' : 'assets/icons/user_managment/disable_eye.png',
                        scale: 1.7,
                        color: const Color(0xFF747474),
                      )
                  ),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 13.h),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
