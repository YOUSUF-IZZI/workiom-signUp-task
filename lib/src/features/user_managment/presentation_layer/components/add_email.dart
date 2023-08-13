import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class AddEmailComponent extends ConsumerWidget {
  const AddEmailComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailTextEditingControllerProvider);
    final passwordController = ref.watch(passwordTextEditingControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your work email', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
        SizedBox(height: 15.h,),
        Row(
          children: [
            Image.asset('assets/icons/user_managment/email.png', width: 18.w,),
            SizedBox(width: 8.w,),
            Expanded(
              child: TextFormField(
                controller: emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: GestureDetector(
                      onTap: (){
                        emailController.text = '';
                      },
                      child: Image.asset('assets/icons/user_managment/x_circle.png', scale: 1.7,)),
                  contentPadding: EdgeInsets.only(top: 15, bottom: 13.h),
                ),
                onChanged: (text) {
                  // Validation of step 2
                  if ( (emailController.text.isNotEmpty == true) && (RegExp(r'^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,}$').hasMatch(emailController.text) == true) && (passwordController.text.length >= 7) && (passwordController.text.contains(RegExp(r'[A-Z]'))) ) {
                    ref.read(isStepTwoValidProvider.notifier).state = true;
                  } else {
                    ref.read(isStepTwoValidProvider.notifier).state = false;
                  }

                  //
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
