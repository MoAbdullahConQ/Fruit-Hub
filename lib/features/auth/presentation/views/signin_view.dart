import 'package:ecommerce_app/core/services/get_it_service.dart';
import 'package:ecommerce_app/features/auth/domain/repos/auth_repo.dart';
import 'package:ecommerce_app/features/auth/presentation/cubits/signin_cubits/signin_cubit.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: SafeArea(
          child: SignInViewBodyBlocConsumer(),
        ),
      ),
    );
  }
}
