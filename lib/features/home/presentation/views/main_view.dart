import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/home_view.dart';
import 'package:flutter/material.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const String routeName = 'main_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(child: HomeView(),),);
  }
}
