import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
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
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'لا تمتلك حساب؟ ',
                      style: TextStyles.semiBold16.copyWith(
                        color: Color(0xFF949D9E),
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyles.semiBold16.copyWith(
                        color: Color(0xFF616A6B),
                      ),
                    ),
                    TextSpan(
                      text: 'قم بإنشاء حساب',
                      style: TextStyles.semiBold16.copyWith(
                        color: Color(0xFF1B5E37),
                      ),
                    ),
                  ],
                ),
              ),
                            SizedBox(height: 33),

            ],
          ),
        ),
      ),
    );
  }
}
