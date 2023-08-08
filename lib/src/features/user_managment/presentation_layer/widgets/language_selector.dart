import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: (){
        showCupertinoModalPopup(context: context, builder: (context) {
          return CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                  onPressed: (){
                    ref.read(languageProvider.notifier).state = 'English';
                    Navigator.pop(context);
                  },
                  child: const Text("English", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4E86F7)),)
              ),
              CupertinoActionSheetAction(
                  onPressed: (){
                    ref.read(languageProvider.notifier).state = 'العربية';
                    Navigator.pop(context);
                  },
                  child: const Text("العربية", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4E86F7)),)
              ),
              CupertinoActionSheetAction(
                  onPressed: (){
                    ref.read(languageProvider.notifier).state = 'Türkçe';
                    Navigator.pop(context);
                  },
                  child: const Text("Türkçe", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4E86F7)),)
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: const Text('Cancel'),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          );
        },);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/user_managment/glob.png', width: 16.w,),
          SizedBox(width: 8.w,),
          Text(ref.watch(languageProvider)),
          SizedBox(width: 8.w,),
          Image.asset('assets/icons/user_managment/toggle.png', width: 6.w, height: 4.h,),
        ],
      ),
    );
  }
}
