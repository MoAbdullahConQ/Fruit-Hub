import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:ecommerce_app/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.bkImage,
    required this.isVisible,
  });

  final Widget title;
  final String subTitle;
  final String image;
  final String bkImage;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,

          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(bkImage, fit: BoxFit.fill),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                  // fit: BoxFit.cover,
                ),
              ),

              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      LoginView.routeName
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'تخط',
                      style: TextStyles.regular13.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 64),
        title,
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.semiBold13.copyWith(color: Color(0xFF4E5556)),
          ),
        ),
      ],
    );
  }
}
