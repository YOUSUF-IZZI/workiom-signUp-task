import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import '../../state_managment/riverpod.dart';


class AddFirstNameComponent extends ConsumerWidget {
  const AddFirstNameComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.watch(signUpFormProvider);
    final isStepThreeValid = ref.watch(isStepThreeValidProvider);
    return ReactiveForm(
      formGroup: signUpForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your  first name', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Image.asset('assets/icons/user_managment/alignment.png', width: 18.w, height: 18.h,),
              SizedBox(width: 8.w,),
              Expanded(
                child: ReactiveTextField(
                  onChanged: (value) {
                    if ( (signUpForm.control('workspaceName').valid == true) && (signUpForm.control('firstName').valid == true) && (signUpForm.control('lastName').valid == true) ) {
                      ref.read(isStepThreeValidProvider.notifier).state = true;
                    }  else {
                      ref.read(isStepThreeValidProvider.notifier).state = false;
                    }
                  },
                  formControlName: 'firstName',
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
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
