
import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'لا تمتلك حساب؟ ',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xFF949D9E),
            ),
          ),
          TextSpan(
            text: ' ',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xFF616A6B),
            ),
          ),
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: TextStyles.semiBold16.copyWith(
              color: Color(0xFF1B5E37),
            ),
          ),
        ],
      ),
    );
  }
}
