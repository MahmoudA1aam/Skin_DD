import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/cubits/sign_up_cubit.dart';

import '../../../../../core/helper/routes/routes_name.dart';
import 'sign_up_view_body.dart';

class SignUpBlocConsumerViewBody extends StatelessWidget {
  const SignUpBlocConsumerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (context) => Center(child: CircularProgressIndicator()),
          );
          return;
        }

        if (state is SignUpFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
        if (state is SignUpSuccess) {
          Navigator.pushNamed(context, RoutesName.loginView);
        }
      },
      child: SignUpViewBody(),
    );
  }
}
