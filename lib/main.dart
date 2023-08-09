import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/sign_up_setp_one.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/sign_up_step_three.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/sing_up_step_two.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Rubik'
          ),
          home: const SignUpPageStepOne(),
          routes: {
            'SignUpPageStepTwo' : (context) => const SignUpPageStepTwo(),
            'SignUpPageStepThree' : (context) => const SignUpPageStepThree()
          },
        );
      },
    );
  }
}
