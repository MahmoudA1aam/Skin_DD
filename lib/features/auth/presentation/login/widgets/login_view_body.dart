import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/auth/data/models/login_model/login_request_model.dart';
import 'package:skin_dd/features/auth/presentation/login/cubits/login_cubit.dart';

import 'package:skin_dd/features/auth/presentation/login/widgets/social_login_button.dart';

import '../../../../../../core/theming/text_style_app.dart';
import '../../../../../core/helper/routes/routes_name.dart';
import '../../../../../core/theming/colors_app.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_from_field.dart';
import 'have_account.dart';
import 'or_divider.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a valid email";
                  }
                },
                hintText: "Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a valid password";
                  }
                },
                hintText: "Password",
                controller: passwordController,
                obscureText: obscureText,
                suffixIcon: IconButton(
                  onPressed: () {
                    obscureText = !obscureText;
                    setState(() {});
                  },
                  icon:
                      obscureText
                          ? const Icon(
                            Icons.visibility,
                            color: Color(0XffC9CECF),
                          )
                          : const Icon(
                            Icons.visibility_off,
                            color: Color(0XffC9CECF),
                          ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password?",
                    textAlign: TextAlign.end,
                    style: TextStylesApp.font13Grey600.copyWith(
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    LoginRequestModel loginModel = LoginRequestModel(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                    context.read<LoginCubit>().login(loginModel: loginModel);
                  }
                },
                title: "Login",
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signUpView);
                },
                child: const CreatAndNotHaveAccount(
                  textHave: "Don't have an account?",
                  creatAccount: " Sign Up ",
                ),
              ),
              const SizedBox(height: 15),
              const OrDivider(),
              const SizedBox(height: 15),
              SocialLoginButton(
                image: "assets/images/google_icon.svg",
                title: "Sign in with Google",
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              SocialLoginButton(
                image: "assets/images/apple_icon.svg",
                title: "Sign in with apple",
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              SocialLoginButton(
                image: "assets/images/facebook_icon.svg",
                title: "Sign in with Facebook",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
