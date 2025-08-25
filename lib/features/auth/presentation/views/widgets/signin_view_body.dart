import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/password_field.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/social_button_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Center(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (p0) {
                    email = p0!;
                  },
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                PasswordField(
                  onSaved: (p0) {
                    password = p0!;
                  },
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
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'تسجيل الدخول',
                ),
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
      ),
    );
  }
}
