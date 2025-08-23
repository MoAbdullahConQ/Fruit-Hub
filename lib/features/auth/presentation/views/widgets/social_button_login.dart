import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButtonLogin extends StatelessWidget {
  const SocialButtonLogin({
    super.key,
    required this.onPressed,
    required this.title,
    required this.image,
  });

  final VoidCallback onPressed;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: TextButton(
        onPressed: onPressed,

        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Color(0xFFDCDEDE), width: 1),
          ),
        ),
        child: ListTile(
          visualDensity: VisualDensity(vertical: VisualDensity.minimumDensity),
          leading: SvgPicture.asset(image),
          title: Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyles.semiBold16.copyWith(color: Color(0xFF0C0D0D)),
          ),
        ),
      ),
    );
  }
}
