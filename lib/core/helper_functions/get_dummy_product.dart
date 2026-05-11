import 'dart:io';

import 'package:ecommerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    code: '123456',
    name: 'منتج تجريبي',
    price: 99.99,
    description: 'هذا وصف تجريبي للمنتج. يحتوي على تفاصيل حول المنتج ومميزاته.',
    imageUrl: 'https://via.placeholder.com/150',
    expirationsMonths: 6,
    image: File(''),
    isFeatured: false,
    numberOfCalories: 200,
    unitAmount: 1,
    reviews: [],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
