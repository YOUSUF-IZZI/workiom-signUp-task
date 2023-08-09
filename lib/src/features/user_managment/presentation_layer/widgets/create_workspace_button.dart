import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:workiom/src/features/user_managment/application_layer/api_services.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/pages/home_page.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class CreateWorkSpaceButton extends ConsumerWidget {
  CreateWorkSpaceButton({super.key});
  final ApiServices apiServices = ApiServices();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.read(signUpFormProvider);
    final isStepThreeValid = ref.watch(isStepThreeValidProvider);
    final isTenantAvailable = ref.watch(isTenantAvailableProvider);
    return MaterialButton(
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: isStepThreeValid ? const Color(0xFF4E86F7) : const Color(0xFFB5B5B5),
      highlightColor: Colors.orangeAccent,
      splashColor: Colors.redAccent,
      onPressed: () async{
        if (isStepThreeValid) {
          if (isTenantAvailable) {
             final returnedValue = await apiServices.registerTenant(
                signUpForm.control('email').value,
                signUpForm.control('firstName').value,
                signUpForm.control('lastName').value,
                signUpForm.control('password').value,
                signUpForm.control('workspaceName').value
            );
            if (returnedValue == true) {
              // if post method done show CupertinoAlertDialog says done.
              await Future.delayed(const Duration(milliseconds: 10), () {
                showCupertinoDialog(context: context, builder: (context) {
                  return CupertinoAlertDialog(
                    title: Lottie.asset('assets/lottie_files/done.json', width: 90.w, height: 90.h),
                    content: Text('Done..', style: TextStyle(fontSize: 16.sp, color: Colors.black),),
                  );
                },);
              });
              await Future.delayed(const Duration(seconds: 1), ()async{
                final responseBody = await apiServices.loginUserIn(
                    signUpForm.control('email').value,
                    signUpForm.control('password').value,
                    signUpForm.control('workspaceName').value
                );
                if (responseBody['success'] == true) {
                  // Save the accessToken in accessToken provider
                  ref.read(accessTokenProvider.notifier).state = responseBody['result']['accessToken'];
                  // now navigate to the home page
                  await Future.delayed(const Duration(milliseconds: 1), (){
                    Navigator.of(context).popUntil((route) => false);
                    Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
                      return const HomePage();
                    },));
                  });
                }
                else if (responseBody['success'] != true) {
                  await Future.delayed(const Duration(milliseconds: 1), () {
                    showCupertinoDialog(context: context, builder: (context) {
                      return CupertinoAlertDialog(
                        title: Lottie.asset('assets/lottie_files/alert_triangle2.json', width: 90.w, height: 90.h),
                        content: Text(responseBody['error']['message'], style: TextStyle(fontSize: 16.sp, color: Colors.red),),
                      );
                    },);
                  });
                }
                else {
                  await Future.delayed(const Duration(milliseconds: 1), () {
                    showCupertinoDialog(context: context, builder: (context) {
                      return CupertinoAlertDialog(
                        title: Lottie.asset('assets/lottie_files/wondering_man.json', width: 90.w, height: 90.h),
                        content: Text('Something went Wrong!', style: TextStyle(fontSize: 16.sp, color: Colors.red),),
                      );
                    },);
                  });
                }
              });
            }  else {
              await Future.delayed(const Duration(milliseconds: 1), () {
                showCupertinoDialog(context: context, builder: (context) {
                  return CupertinoAlertDialog(
                    title: Lottie.asset('assets/lottie_files/wondering_man.json', width: 90.w, height: 90.h),
                    content: Text('Something went Wrong!', style: TextStyle(fontSize: 16.sp, color: Colors.red),),
                  );
                },);
              });
            }
          }
          else {
            showCupertinoDialog(context: context, builder: (context) {
              return CupertinoAlertDialog(
                title: Lottie.asset('assets/lottie_files/alert_sign.json', width: 90.w, height: 90.h),
                content: Text('Workspace name already exist', style: TextStyle(fontSize: 16.sp, color: Colors.red),),
              );
            },);
          }
        }
        else {
          showCupertinoDialog(context: context, builder: (context) {
            return CupertinoAlertDialog(
              title: Lottie.asset('assets/lottie_files/filling_forms.json', width: 90.w, height: 90.h),
              content: Text('Please fill all required fields', style: TextStyle(fontSize: 16.sp, color: Colors.red),),
            );
          },);
        }
      },

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Spacer(flex: 3 ,),
          Text('Create Workspace', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
          const Spacer(flex: 2,),
          Image.asset('assets/icons/user_managment/enter.png', width: 19.w, height: 19 .h ,)
        ],
      ),
    );
  }
}