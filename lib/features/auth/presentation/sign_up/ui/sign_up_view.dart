import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/cubits/sign_up_cubit.dart';

import '../../../../../core/services/get_it/get_it.dart';
import '../../../../../core/widgets/custom_app_bar.dart';
import '../../../data/repos/auth_repo.dart';
import '../widgets/sign_up_bloc_consumer_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Sign Up",
        context: context,
        isVisible: true,
        isVisibleAction: false,
      ),
      body: BlocProvider(
        create: (context) => SignUpCubit(authRepo: getIt.get<AuthRepo>()),
        child: const SignUpBlocConsumerViewBody(),
      ),
    );
  }
}
