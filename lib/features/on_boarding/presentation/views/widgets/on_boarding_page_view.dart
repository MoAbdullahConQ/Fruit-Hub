import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/utils/app_text_style.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    // this.onPageChanged,
  });

  final PageController pageController;
  // final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      // onPageChanged: onPageChanged,
      children: [
        PageViewItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('مرحبًا بك في', style: TextStyles.bold23),
              Text(
                ' HUB',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.secoundryColor,
                ),
              ),
              Text(
                'Fruit',
                style: TextStyles.bold23.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.imagesPageViewItem1ImageSvg,
          bkImage: Assets.imagesPageViewItem1BkImage,
          isVisible:
              true,
        ),
        PageViewItem(
          isVisible:
              false,
          title: Text(
            'ابحث وتسوق',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff0c0d0d),
              fontSize: 23,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          image: Assets.imagesPageViewItem2ImageSvg,
          bkImage: Assets.imagesPageViewItem2BkImage,
        ),
      ],
    );
  }
}
