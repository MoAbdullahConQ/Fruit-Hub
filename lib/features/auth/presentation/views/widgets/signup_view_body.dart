import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/core/helper_functions/build_error_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_button.dart';
import 'package:ecommerce_app/core/widgets/password_field.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/have_account_widget.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode;
  late String email, password, name;

  late bool isTermsAccepted = false;
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
              children: [
                SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: 'الاسم كامل',
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: 'البريد الإلكتروني',
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                PasswordField(
                  onSaved: (value) {
                    password = value!;
                  },
                ),
                SizedBox(height: 16),
                TermsAndConditions(
                  onChanged: (value) {
                    setState(() {
                      isTermsAccepted = value;
                    });
                  },
                ),
                SizedBox(height: 30),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              name: name,
                              email: email,
                              password: password,
                            );
                      }else {
                        buildErrorBar(
                            context, 'يجب الموافقة على الشروط والأحكام');
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: 'إنشاء حساب جديد',
                ),
                SizedBox(height: 26),
                HaveAccountWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
