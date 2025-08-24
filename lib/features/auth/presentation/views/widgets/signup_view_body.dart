import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.remove_red_eye, color: Color(0xFFC9CECF)),
                ),
                hintText: 'كلمة المرور',
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 16),
              TermsAndConditions(),
            ],
          ),
        ),
      ),
    );
  }
}
