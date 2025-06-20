import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/auth/presentation/login/cubits/login_cubit.dart';
import 'package:skin_dd/features/auth/presentation/login/widgets/login_view_body.dart';

import '../../../../../core/constans/shared_pref_constans.dart';
import '../../../../../core/helper/functions_helper.dart';
import '../../../../../core/helper/routes/routes_name.dart';
import '../../../../../core/helper/shared_pref_helper/shared_pref.dart';

class LoginViewBlocConsumer extends StatelessWidget {
  const LoginViewBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state is LoginFailure) {
          SnackBarService.showErrorMessage(state.errorMessage);
        }
        if (state is LoginSuccess) {
          String? email = state.loginModel.user!.email;
          String? firstName = state.loginModel.user!.firstName;
          String? lastName = state.loginModel.user!.lastName;
          String? birthdate = state.loginModel.user!.birthdate;
          String? userId = state.loginModel.user!.sId;
          String? accessToken = state.loginModel.accessToken;
          String? profileImage = state.loginModel.user!.profileImage;

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
            key: SharedPrefConstans.firstName,
            value: firstName,
          );
          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.lastName,
            value: lastName,
          );
          await SharedPreferencesHelper.saveDate(
            key: SharedPrefConstans.userToken,
            value: accessToken,
          );
          var emailll = SharedPreferencesHelper.getDate(
            key: SharedPrefConstans.userEmail,
          );
          if (profileImage != null) {
            await SharedPreferencesHelper.saveDate(
              key: SharedPrefConstans.profileImage,
              value: profileImage,
            );
            await SharedPreferencesHelper.saveDate(
              key: SharedPrefConstans.imageProfileinvalid,
              value: true,
            );
          } else {
            await SharedPreferencesHelper.saveDate(
              key: SharedPrefConstans.imageProfileinvalid,
              value: false,
            );
          }

          log("emialll ${emailll}");

          Navigator.pushNamed(context, RoutesName.homeView);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            LoginViewBody(),
            if (state is LoginLoading)
              Container(
                color: Colors.black54, // خلفية شفافة لتغطية الشاشة
                child: const Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [CircularProgressIndicator(color: Colors.white)],
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
