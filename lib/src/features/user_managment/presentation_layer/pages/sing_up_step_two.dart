import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/add_email.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/add_password.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/password_checker.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/waving_label.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/workiom_bottom_label.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/sign_up_step_three.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/widgets/custom_linear_progress_indicator.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/widgets/custom_material_button.dart';


class SignUpPageStepTwo extends StatelessWidget {
  const SignUpPageStepTwo({super.key});

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
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/icons/user_managment/back_arrow.png', width: 18.w, height: 24.h,),
                ),
                SizedBox(height: 19.h,),

                Text(
                  'Enter a strong password',
                  style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, letterSpacing: 0.36.sp, color: const Color(0xFF0E0F12),),
                ),
                SizedBox(height: 8.h,),

                const WavingLabel(),
                SizedBox(height: 80.h,),

                const AddEmailComponent(),
                SizedBox(height: 24.h,),

                const AddPasswordComponent(),
                SizedBox(height: 15.h,),

                const CustomLinearProgressIndicator(),
                SizedBox(height: 9.h,),

                const PasswordCheckerComponent(),
                SizedBox(height: 30.h,),
                
                CustomMaterialButton(
                    buttonName: 'Confirm password',
                    onPressed: (){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                        return const SignUpPageStepThree();
                      },));
                    }
                ),

                SizedBox(height: 90.h,),
                const WorkiomLabel( ),
                SizedBox(height: 80.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}















