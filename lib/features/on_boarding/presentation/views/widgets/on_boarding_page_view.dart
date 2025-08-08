import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        PageViewItem(
          title: Row(
            children: [
              Text('مرحبًا بك في'),
              Text('HUB'),
              Text('Fruit'),
            ],
          ),
          subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.imagesPageViewItem1ImageSvg,
          bkImage: Assets.imagesPageViewItem1BkImage,
        ),
      ],
    );
  }
}
