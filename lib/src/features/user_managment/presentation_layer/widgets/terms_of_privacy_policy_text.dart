import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PrivacyPolicyText extends StatelessWidget {
  const PrivacyPolicyText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'By signing up, you agree ',
          style: TextStyle(fontSize: 13.sp, color: const Color(0xFF555555)),
          children:  <TextSpan>[
            TextSpan(
              text: 'Terms Of Service\n',
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer ()..onTap = () {}
            ),
            // can add more TextSpans here...
            const TextSpan(
              text: 'And ',
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: const TextStyle(
                decoration: TextDecoration.underline,
              ),
                recognizer: TapGestureRecognizer ()..onTap = () {}
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}