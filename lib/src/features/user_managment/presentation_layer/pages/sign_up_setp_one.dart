import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/waving_label.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/workiom_bottom_label.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/sing_up_step_two.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/widgets/custom_material_button.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/widgets/language_selector.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/widgets/sign_up_with_google_button.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/widgets/terms_of_privacy_policy_text.dart';


class SignUpPageStepOne extends StatelessWidget {
  const  SignUpPageStepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/icons/user_managment/back_arrow.png', width: 18.w, height: 24.h,),
                    SizedBox(width: 5.w,),
                    Text('Sign in', style: TextStyle(fontSize: 17.sp, color: const Color(0xFF4E86F7), fontWeight: FontWeight.w400),)
                  ],
                ),
                SizedBox(height: 19.h,),
                Text(
                  'Create your free account',
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, letterSpacing: 0.36.sp, color: const Color(0xFF0E0F12),),
                ),
                SizedBox(height: 8.h,),
                const WavingLabel(),
                SizedBox(height: 120.h,),
                const SignUpWithGoogleButton(),
                SizedBox(height: 30.h,),
                Align(
                  alignment: Alignment.center,
                  child: Text( 'or', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: const Color(0xFF555555),),
                  ),
                ),
                SizedBox(height: 30.h,),
                CustomMaterialButton(
                  buttonName: 'Continue with email',
                  buttonColor: const Color(0xff4E86F7),
                  onPressed: (){
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                      return const SignUpPageStepTwo();
                    },));
                  },
                ),
                SizedBox(height: 16.h,),
                PrivacyPolicyText(),
                SizedBox(height: 100.h,),
                const LanguageSelector(),
                SizedBox(height: 19.h,),
                const WorkiomLabel( ),
                SizedBox(height: 30.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






