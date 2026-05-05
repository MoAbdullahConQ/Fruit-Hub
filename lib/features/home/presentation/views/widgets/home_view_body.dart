import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/widgets/search_text_field.dart';
import 'package:ecommerce_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: Column(
            children: [
              SizedBox(height: kTopPadding,),
              CustomHomeAppBar(),
              SizedBox(height: 16,),
              SearchTextField()
            ],
          )),
          // Add more slivers here as needed
        ],
      ),
    );
  }
}
