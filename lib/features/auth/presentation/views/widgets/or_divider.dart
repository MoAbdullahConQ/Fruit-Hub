import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(endIndent: 18 , color: Color(0xFFDCDEDE),)),
        Text('أو', style: TextStyles.semiBold16),
        Expanded(child: Divider(indent: 18, color: Color(0xFFDCDEDE),)),
      ],
    );
  }
}
