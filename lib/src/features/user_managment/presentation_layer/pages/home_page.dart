import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/workiom_bottom_label.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 310.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.h),
                child: Text('Thank you for choosing', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: const Color(0xFF0E0F12),) ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Workriom', style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: const Color(0xFF0E0F12),),),
                    SizedBox(width: 5.w,),
                    Image.asset('assets/icons/user_managment/workiom.png', width: 35.w,),
                ],),
              ),
              SizedBox(height: 314.h,),
              const WorkiomLabel(),
              SizedBox(height: 77.h,)
            ],
          ),
        ),
      ),
    );
  }
}
