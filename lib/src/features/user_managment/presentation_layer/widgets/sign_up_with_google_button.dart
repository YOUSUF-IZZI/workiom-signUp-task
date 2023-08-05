import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignUpWithGoogleButton extends StatelessWidget {
  const SignUpWithGoogleButton({super.key,});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: const Color(0xFFF4F4F4),
      highlightColor: Colors.orangeAccent,
      splashColor: Colors.redAccent,
      onPressed: (){},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          Image.asset('assets/icons/user_managment/google_colorful.png', height: 16.h,),
          SizedBox(width: 8.w,),
          Text('Continue with Google', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: const Color(0xFF0E0F12)), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}