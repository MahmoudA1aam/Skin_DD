import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/core/constans/shared_pref_constans.dart';
import 'package:skin_dd/core/services/get_it/get_it.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';
import 'package:skin_dd/features/auth/presentation/login/cubits/login_cubit.dart';

import '../../../../../core/helper/routes/routes_name.dart';
import '../../../../../core/helper/shared_pref_helper/shared_pref.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Login", isVisible: false, context: context),
      body: BlocProvider(
        create: (context) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
        child: LoginViewBlocListener(),
      ),
    );
  }
}

class LoginViewBlocListener extends StatelessWidget {
  const LoginViewBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
          return;
        }

        if (state is LoginFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
        if (state is LoginSuccess) {
          String? email = state.loginModel.user!.email;
          String? name = state.loginModel.user!.firstName;
          String? birthdate = state.loginModel.user!.birthdate;
          String? userId = state.loginModel.user!.sId;
          String? accessToken = state.loginModel.accessToken;

          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.userEmail,
            value: email,
          );
          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.userId,
            value: userId,
          );
          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.userBirthdate,
            value: birthdate,
          );
          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.userNmae,
            value: name,
          );
          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.userToken,
            value: accessToken,
          );
          var emailll = SharedPreferencesHelper.getDate(
            key: SharedPrefConstans.userEmail,
          );
          log("emialll ${emailll}");

          Navigator.pushNamed(context, RoutesName.homeView);
        }
      },
      child: LoginViewBody(),
    );
  }
}
