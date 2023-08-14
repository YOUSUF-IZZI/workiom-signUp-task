import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/add_first_name.dart';
import 'package:workiom/src/features/user_managment/presentation_layer/components/add_workspace.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


GlobalKey<FormState> lastNameForm = GlobalKey<FormState>();

class AddLastNameComponent extends ConsumerWidget {
  const AddLastNameComponent({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastNameController = ref.watch(lastNameTextEditingControllerProvider);
    return Form(
      key: lastNameForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your last name', style: TextStyle(fontSize: 15.sp, color: const Color(0xFF0E0F12)),),
          SizedBox(height: 15.h,),
          Row(
            children: [
              Image.asset('assets/icons/user_managment/alignment.png', width: 18.w, height: 18.h,),
              SizedBox(width: 8.w,),
              Expanded(
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    contentPadding: EdgeInsets.only(top: 15, bottom: 13.h),
                  ),
                  validator: (text){
                    if (lastNameController.text.isEmpty) {
                      return 'This field is required.';
                    }
                    if (!lastNameController.text.contains(RegExp(r'^[a-zA-Z]+$'))) {
                      return 'Last name should be Letters only';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Setting isStepThreeValidProvider value
                    if (workspaceForm.currentState!.validate() && firstNameForm.currentState!.validate() && lastNameForm.currentState!.validate()) {
                      ref.read(isStepThreeValidProvider.notifier).state = true;
                    }  else {
                      ref.read(isStepThreeValidProvider.notifier).state = false;
                    }
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
