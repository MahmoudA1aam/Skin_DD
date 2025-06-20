import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:skin_dd/core/services/get_it/get_it.dart';
import 'package:skin_dd/features/auth/data/repos/auth_repo.dart';
import 'package:skin_dd/features/auth/presentation/login/cubits/login_cubit.dart';
import 'package:skin_dd/features/auth/presentation/login/widgets/login_view_bloc_consumer.dart';

import '../../../../../core/widgets/custom_app_bar.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Login",
        isVisible: false,
        context: context,
        isVisibleAction: false,
      ),
      body: BlocProvider(
        create: (context) => LoginCubit(authRepo: getIt.get<AuthRepo>()),
        child: LoginViewBlocConsumer(),
      ),
    );
  }
}
