import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/application_layer/api_services.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/add_first_name.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/add_last_name.dart';
import '../../state_managment/riverpod.dart';



GlobalKey<FormState> workspaceForm = GlobalKey<FormState>();

class AddWorkspaceComponent extends ConsumerWidget {
  AddWorkspaceComponent({super.key});
  final ApiServices apiServices = ApiServices() ;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaceController = ref.watch(workspaceTextEditingControllerProvider);
    return Form(
      key: workspaceForm,
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: workspaceController,
                  decoration: InputDecoration(
                    hintText: 'Workspace name*',
                    suffixIcon: Image.asset('assets/images/user_managment/.workiom.com.png', width: 100.w, height: 24.h,),
                    contentPadding: EdgeInsets.only(top: 15, bottom: 13.h),
                  ),
                  onChanged: (text) async{
                    // calling isTenantAvailable function to set isTenantAvailableProvider value
                    if (( await apiServices.isTenantAvailable(workspaceController.text) ) != null) {
                      ref.read(isTenantAvailableProvider.notifier).state = false;
                    } else {
                      ref.read(isTenantAvailableProvider.notifier).state = true;
                    }
                    // Setting isStepThreeValidProvider value
                    if (workspaceForm.currentState!.validate() && firstNameForm.currentState!.validate() && lastNameForm.currentState!.validate()) {
                      ref.read(isStepThreeValidProvider.notifier).state = true;
                    }  else {
                      ref.read(isStepThreeValidProvider.notifier).state = false;
                    }
                  },
                  validator: (text) {
                    if (workspaceController.text.isEmpty) {
                      return 'This field is required.';
                    }
                    if (!ref.watch(isTenantAvailableProvider)) {
                      return 'Workspace already exist';
                    }
                    if (!workspaceController.text[0].contains(RegExp(r'^[a-zA-Z]'))) {
                      return 'Invalid';
                    }
                    if (workspaceController.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>_ ]'))) {
                      return 'Invalid';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
