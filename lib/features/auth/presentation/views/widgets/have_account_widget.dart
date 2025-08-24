import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccountWidget extends StatelessWidget {
  const HaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'تمتلك حساب بالفعل؟',
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF949D9E)),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF616A6B)),
          ),
          TextSpan(
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
            text: 'تسجيل الدخول',
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF1B5E37)),
          ),
        ],
      ),
    );
  }
}
