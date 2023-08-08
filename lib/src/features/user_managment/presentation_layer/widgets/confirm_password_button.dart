import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/sign_up_step_three.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class ConfirmPasswordButton extends ConsumerWidget {
  const ConfirmPasswordButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStepTwoValid = ref.watch(isStepTwoValidProvider);
    return MaterialButton(
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: isStepTwoValid ? const Color(0xFF4E86F7) : const Color(0xFFB5B5B5),
      highlightColor: Colors.orangeAccent,
      splashColor: Colors.redAccent,
      onPressed: (){
        if (isStepTwoValid) {
          Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
            return const SignUpPageStepThree();
          },));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Spacer(flex: 3 ,),
          Text('Confirm password', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
          const Spacer(flex: 2,),
          Image.asset('assets/icons/user_managment/enter.png', width: 19.w, height: 19 .h ,)
        ],
      ),
    );
  }
}
