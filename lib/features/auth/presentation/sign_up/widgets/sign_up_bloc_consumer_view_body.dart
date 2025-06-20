import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/cubits/sign_up_cubit.dart';

import '../../../../../core/helper/functions_helper.dart';
import '../../../../../core/helper/routes/routes_name.dart';
import 'sign_up_view_body.dart';

class SignUpBlocConsumerViewBody extends StatelessWidget {
  const SignUpBlocConsumerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          SnackBarService.showErrorMessage(state.message);
        }
        if (state is SignUpSuccess) {
          Navigator.pushNamed(context, RoutesName.loginView);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            const SignUpViewBody(),
            if (state is SignUpLoading)
              Container(
                color: Colors.black54,
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
