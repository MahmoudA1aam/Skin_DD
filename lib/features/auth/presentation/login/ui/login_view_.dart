import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/core/services/get_it/get_it.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';
import 'package:skin_dd/features/auth/presentation/login/cubits/login_cubit.dart';

import '../../../../../core/helper/routes/routes_name.dart';
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
      listener: (context, state) {
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
          Navigator.pushNamed(context, RoutesName.homeView);
        }
      },
      child: LoginViewBody(),
    );
  }
}
