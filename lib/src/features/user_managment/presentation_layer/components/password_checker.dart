import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class PasswordCheckerComponent extends ConsumerWidget {
  const PasswordCheckerComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final indicatorCounter = ref.watch(indicatorCounterProvider);
              return Image.asset(indicatorCounter < 1/4 ? 'assets/icons/user_managment/wrong_mark.png' : indicatorCounter < 3/4 ? 'assets/icons/user_managment/exclamation_mark.png' : 'assets/icons/user_managment/right_mark.png', width: 16.w, height: 16.h,);
            },),
            SizedBox(width: 8.w,),
            Consumer(builder: (context, ref, child) {
              final indicatorCounter = ref.watch(indicatorCounterProvider);
              return Text(indicatorCounter < 1/4 ? 'weak' : indicatorCounter < 3/4 ? 'Not enought strong' : 'Pretty safe' , style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold ),);
            },)
          ],
        ),
        SizedBox(height: 4.h,),
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final passwordLengthChecker = ref.watch(passwordLengthCheckerProvider);
              return Image.asset(passwordLengthChecker ? 'assets/icons/user_managment/right_mark.png' : 'assets/icons/user_managment/wrong_mark.png' ,width: 16.w, height: 16.h,) ;
            },),
            SizedBox(width: 8.w,),
            Text('Passwords must have at least 7 characters', style: TextStyle(fontSize: 12.sp),)
          ],
        ),
        SizedBox(height: 4.h,),
        Row(
          children: [
            Consumer(builder: (context, ref, child) {
              final passwordUppercaseChecker = ref.watch(passwordUppercaseCheckerProvider);
              return Image.asset(passwordUppercaseChecker ? 'assets/icons/user_managment/right_mark.png' : 'assets/icons/user_managment/wrong_mark.png', width: 16.w, height: 16.h,) ;
            },),
            SizedBox(width: 8.w,),
            Text('Passwords must have at least one uppercase (\'A\'-\'Z\').', style: TextStyle(fontSize: 12.sp),)
          ],
        )
      ],
    );
  }
}
