import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workiom/src/features/user_managment/state_managment/riverpod.dart';


class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({super.key,});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Consumer(
        builder: (context, ref, child) {
          final indicatorCounter = ref.watch(indicatorCounterProvider);
          return LinearProgressIndicator(
            value: indicatorCounter,
            backgroundColor: const Color(0xFFF4F4F4),
            color: indicatorCounter < 1 / 4
                ? Colors.red
                : indicatorCounter <= 2 / 4
                ? Colors.orange
                : indicatorCounter <= 3 / 4
                ? const Color(0xFFF5C044)
                : const Color(0xFF5BD77E),
            //valueColor: indicatorCounter != 1 ? const AlwaysStoppedAnimation<Color>(Color(0xFFF5C044)) : const AlwaysStoppedAnimation<Color>(Color(0xFF5BD77E) ),
          );
        },
      )
    );
  }
}