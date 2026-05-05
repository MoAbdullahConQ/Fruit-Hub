import 'package:ecommerce_app/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldHome,
    inActiveImage: Assets.imagesOutlineHome,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldProducts,
    inActiveImage: Assets.imagesOutlineProducts,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldShoppingCart,
    inActiveImage: Assets.imagesOutlineShoppingCart,
    name: 'سلة التسوق',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldUser,
    inActiveImage: Assets.imagesOutlineUser,
    name: 'حسابي',
  ),
];
