import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WorkiomLabel extends StatelessWidget {
  const WorkiomLabel({super.key,});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Stay organized with', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF555555)),),
        SizedBox(width: 8.h,),
        Image.asset('assets/icons/user_managment/workiom.png', width: 31.w, height: 31.h,),
        SizedBox(width: 7.w,),
        Text('workiom', style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),)
      ],
    );
  }
}