import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:workiom/src/features/user_managment/application_layer/api_services.dart';
import '../../state_managment/riverpod.dart';


class AddWorkspaceComponent extends ConsumerWidget {
  AddWorkspaceComponent({super.key});
  final ApiServices apiServices = ApiServices() ;
  final TextEditingController workspaceName = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpForm = ref.watch(signUpFormProvider);
    return ReactiveForm(
      formGroup: signUpForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your company or team name', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
          SizedBox(height: 15.h,),
          Row(
            children: [
              const Icon(Icons.group),
              SizedBox(width: 8.w,),
              Expanded(
                child: ReactiveTextField(
                  onChanged: (value) async{
                    // calling isTenantAvailable function to set isTenantAvailableProvider value
                    if (( await apiServices.isTenantAvailable(signUpForm.control('workspaceName').value) ) != null) {
                      ref.read(isTenantAvailableProvider.notifier).state = false;
                    } else {
                      ref.read(isTenantAvailableProvider.notifier).state = true;
                    }
                    // Setting isStepThreeValidProvider value
                    if ( (signUpForm.control('workspaceName').valid == true) && (signUpForm.control('firstName').valid == true) && (signUpForm.control('lastName').valid == true) ) {
                      ref.read(isStepThreeValidProvider.notifier).state = true;
                    }  else {
                      ref.read(isStepThreeValidProvider.notifier).state = false;
                    }
                  },
                  formControlName: 'workspaceName',
                  decoration: InputDecoration(
                    hintText: 'Workspace name*',
                    suffixIcon: Image.asset('assets/images/user_managment/.workiom.com.png', width: 100.w, height: 24.h,),
                    contentPadding: EdgeInsets.only(top: 15, bottom: 13.h),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
