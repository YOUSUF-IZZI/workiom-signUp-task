import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../state_managment/riverpod.dart';


class AddEmailComponent extends ConsumerWidget {
  const AddEmailComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.watch(signUpFormProvider);
    return ReactiveForm(
      formGroup: signUpForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your work email', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Image.asset('assets/icons/user_managment/email.png', width: 18.w,),
              SizedBox(width: 8.w,),
              Expanded(
                child: ReactiveTextField(
                  onChanged: (value){
                    if ((signUpForm.control('email').valid == true) && (signUpForm.control('password').valid == true)) {
                      ref.read(indicatorCounterProvider.notifier).state= 1.0;
                      ref.read(isStepTwoValidProvider.notifier).state = true;
                    } else if ((signUpForm.control('email').valid == true) && (signUpForm.control('password').valid == false)) {
                      ref.read(indicatorCounterProvider.notifier).state= 0.5;
                      ref.read(isStepTwoValidProvider.notifier).state = false;
                    } else if ((signUpForm.control('email').valid == false) && (signUpForm.control('password').valid == true)) {
                      ref.read(indicatorCounterProvider.notifier).state= 0.5;
                      ref.read(isStepTwoValidProvider.notifier).state = false;
                    } else {
                      ref.read(indicatorCounterProvider.notifier).state= 0.0;
                      ref.read(isStepTwoValidProvider.notifier).state = false;
                    } },
                  formControlName: 'email',
                  decoration: InputDecoration(
                    hintText: 'Email',
                    suffixIcon: GestureDetector(
                      onTap: (){
                        signUpForm.control('email').value = '' ;
                      },
                        child: Image.asset('assets/icons/user_managment/x_circle.png', scale: 1.5,)),
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
