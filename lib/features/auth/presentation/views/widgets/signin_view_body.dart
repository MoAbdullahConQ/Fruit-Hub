import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/social_button_login.dart';
import 'package:flutter/material.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 24),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyles.semiBold13.copyWith(
                      color: AppColors.lightPrimaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32),
              CustomButton(onPressed: () {}, text: 'تسجيل الدخول'),
              SizedBox(height: 33),
              DontHaveAccountWidget(),
              SizedBox(height: 33),
              OrDivider(),
              SizedBox(height: 16),
              SocialButtonLogin(
                onPressed: () {},
                title: 'تسجيل بواسطة جوجل',
                image: Assets.imagesGoogleIocn,
              ),
              SizedBox(height: 16),
              SocialButtonLogin(
                onPressed: () {},
                title: 'تسجيل بواسطة أبل',
                image: Assets.imagesAppleIocn,
              ),
              SizedBox(height: 16),
              SocialButtonLogin(
                onPressed: () {},
                title: 'تسجيل بواسطة فيسبوك',
                image: Assets.imagesFacebookIocn,
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
