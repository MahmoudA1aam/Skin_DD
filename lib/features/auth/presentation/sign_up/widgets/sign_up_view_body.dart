import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_request_model.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/cubits/sign_up_cubit.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/widgets/password_vaildation.dart';

import '../../../../../core/helper/app_regex.dart';

import '../../../../../core/theming/text_style_app.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_from_field.dart';
import '../../login/widgets/have_account.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = false;
  List<String> option = ["Male", "Female"];
  String? currentvalue;
  bool ischeked1 = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;

  @override
  void initState() {
    setupPasswordControllerListener();
    // TODO: implement initState
    super.initState();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                style: TextStylesApp.font14PrimaryColor400.copyWith(
                  color: Color(0xff757575),
                ),
                textAlign: TextAlign.start,
              ),

              const SizedBox(height: 24),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please enter a valid name";
                  }
                },
                hintText: "Name",
                controller: namecontroller,
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().isEmpty ||
                      !AppRegex.isEmailValid(value)) {
                    return "please enter a valid email";
                  }
                },
                hintText: "Email",
                controller: emailcontroller,
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().isEmpty ||
                      !AppRegex.hasMinLength(value) ||
                      !AppRegex.hasNumber(value) ||
                      !AppRegex.hasSpecialCharacter(value) ||
                      !AppRegex.hasUpperCase(value) ||
                      !AppRegex.hasLowerCase(value)) {
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
              SizedBox(height: 25),
              PasswordValidation(
                hasLowerCase: hasLowerCase,
                hasUpperCase: hasUpperCase,
                hasSpecialCharacters: hasSpecialCharacters,
                hasNumber: hasNumber,
                hasMinLength: hasMinLength,
              ),
              const SizedBox(height: 24),

              /*     Row(
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5 - (16),
                    child: RadioListTile(
                      activeColor: ColorsApp.primaryColor,

                      title: Text(
                        option[0],
                        style: TextStylesApp.font16Black600,
                      ),
                      value: option[0],
                      groupValue: currentvalue,
                      onChanged: (value) {
                        setState(() {
                          currentvalue = value.toString();
                        });
                      },
                    ),
                  ),

                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5 - (16),
                    child: RadioListTile(
                      activeColor: ColorsApp.primaryColor,

                      title: Text(
                        option[1],
                        style: TextStylesApp.font16Black600,
                      ),
                      value: option[1],
                      groupValue: currentvalue,
                      onChanged: (value) {
                        setState(() {
                          currentvalue = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),*/
              SizedBox(height: 25),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SignUpRequestModel signUpModel = SignUpRequestModel(
                      birthdate: "2003-10-10",
                      email: emailcontroller.text,
                      lastName: namecontroller.text,
                      firstName: namecontroller.text,
                      password: passwordController.text,
                      profileImage: "null",
                    );
                    context.read<SignUpCubit>().signUp(
                      signUpModel: signUpModel,
                    );
                  }
                },
                title: "Create Account ",
              ),
              SizedBox(height: 25),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CreatAndNotHaveAccount(
                  textHave: "Already have an account yet?  ",
                  creatAccount: "Sign In",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
