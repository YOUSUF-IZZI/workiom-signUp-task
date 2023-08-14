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
    final emailController = ref.watch(emailTextEditingControllerProvider);
    final passwordController = ref.watch(passwordTextEditingControllerProvider);
    final isStepThreeValid = ref.watch(isStepThreeValidProvider);
    final workspaceController = ref.watch(workspaceTextEditingControllerProvider);
    final firstNameController = ref.watch(firstNameTextEditingControllerProvider);
    final lastNameController = ref.watch(lastNameTextEditingControllerProvider);
    final isCirProIndiLoading = ref.watch(isCircularProgressIndicatorLoading);

    return MaterialButton(
      height: 50.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      color: isStepThreeValid ? const Color(0xFF4E86F7) : const Color(0xFFB5B5B5),
      onPressed: () async{
        if (isStepThreeValid) {
          final returnedValue = await apiServices.registerTenant(
              emailController.text,
              firstNameController.text,
              lastNameController.text,
              passwordController.text,
              workspaceController.text
          );
          if (returnedValue == true) {
            // make the step2 and step3 as not valid and active the CircularProgressIndicator
            ref.read(isStepThreeValidProvider.notifier).state = false;
            ref.read(isCircularProgressIndicatorLoading.notifier).state = true;
            await Future.delayed(const Duration(seconds: 1), ()async{
              final responseBody = await apiServices.loginUserIn(
                  emailController.text,
                  passwordController.text,
                  workspaceController.text
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
          }
        }
      },

      // show the row of the button according to the isCircularProgressIndicatorLoading provider
      child: isCirProIndiLoading ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          SizedBox(
            height: 20.h, width: 20.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w,),
          Text('Complete and start working' , style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
        ],
      ) :
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:  [
          const Spacer(flex: 3 ,),
          Text('Create Workspace', style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white), textAlign: TextAlign.center,),
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