import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';


class PrivacyPolicyText extends StatelessWidget {
  PrivacyPolicyText({super.key,});

  final Uri termsUrl = Uri.parse('https://workiom.com/terms-conditions');
  final Uri privecyUrl = Uri.parse('https://workiom.com/privacy-policy');
  
  void launchWebUrl(Uri url) async{
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppWebView);
    }  else {
      print('---------------------------------');
      throw 'Could not launch $url';
    }
  }
  
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
              recognizer: TapGestureRecognizer ()..onTap = (){
                launchWebUrl(termsUrl);
              }
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
                recognizer: TapGestureRecognizer ()..onTap = () {
                  launchWebUrl(privecyUrl);
                }
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}