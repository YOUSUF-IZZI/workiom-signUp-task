import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WavingLabel extends StatelessWidget {
  const WavingLabel({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Let\'s start an amazing journey!',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF555555),
          ),
        ),
        SizedBox(width: 8.w,),
        Image.asset('assets/icons/user_managment/waving_hand.png', width: 22.w, height: 22.h,),
      ],
    );
  }
}