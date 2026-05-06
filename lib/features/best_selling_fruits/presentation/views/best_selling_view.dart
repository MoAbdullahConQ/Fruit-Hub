import 'package:ecommerce_app/features/best_selling_fruits/presentation/views/widgets/best_selling_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/build_app_bar.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const String routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),

      body: SafeArea(child: BestSellingViewBody()),
    );
  }
}
