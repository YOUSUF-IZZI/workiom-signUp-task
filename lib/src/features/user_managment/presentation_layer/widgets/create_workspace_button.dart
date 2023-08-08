import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/application_layer/api_services.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class CreateWorkSpaceButton extends ConsumerWidget {
  CreateWorkSpaceButton({super.key});
  final ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.watch(signUpFormProvider);
    final isStepThreeValid = ref.watch(isStepThreeValidProvider);
    return MaterialButton(
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: isStepThreeValid ? const Color(0xFF4E86F7) : const Color(0xFFB5B5B5),
      highlightColor: Colors.orangeAccent,
      splashColor: Colors.redAccent,
      onPressed: (){
        apiServices.registerTenant(
            signUpForm.control('email').value,
            signUpForm.control('firstName').value,
            signUpForm.control('lastName').value,
            signUpForm.control('password').value,
            signUpForm.control('workspaceName').value
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Spacer(flex: 3 ,),
          Text('Create Workspace', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
          const Spacer(flex: 2,),
          Image.asset('assets/icons/user_managment/enter.png', width: 19.w, height: 19 .h ,)
        ],
      ),
    );
  }
}