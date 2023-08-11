import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key, required this.buttonName, this.buttonColor = const Color(0xffB5B5B5), this.onPressed });
  final String buttonName;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: buttonColor,
      highlightColor: Colors.orangeAccent,
      splashColor: Colors.redAccent,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Spacer(flex: 3 ,),
          Text(buttonName, style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
           const Spacer(flex: 2,),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('assets/icons/user_managment/enter_background.png', width: 24.w  ),
              Image.asset('assets/icons/user_managment/enter.png', width: 19.w, height: 19 .h ,),
            ],
          ),
        ],
      ),
    );
  }
}