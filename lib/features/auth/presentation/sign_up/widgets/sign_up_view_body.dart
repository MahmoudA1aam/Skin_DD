import 'package:flutter/material.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/widgets/custom_radio_button.dart';

import '../../../../../core/theming/colors_app.dart';
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
  TextEditingController controller = TextEditingController();
  bool obscureText = false;
  List<String> option = ["Male", "Female"];
  String? currentvalue;
  bool ischeked1 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
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
              validator: (p0) {},
              hintText: "Name",
              controller: controller,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              validator: (p0) {},
              hintText: "Email",
              controller: controller,
            ),
            const SizedBox(height: 24),
            CustomTextFormField(
              validator: (p0) {},
              hintText: "Password",
              controller: controller,
              obscureText: obscureText,
              suffixIcon: IconButton(
                onPressed: () {
                  obscureText = !obscureText;
                  setState(() {});
                },
                icon:
                    obscureText
                        ? const Icon(Icons.visibility, color: Color(0XffC9CECF))
                        : const Icon(
                          Icons.visibility_off,
                          color: Color(0XffC9CECF),
                        ),
              ),
            ),
            const SizedBox(height: 24),

            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5 - (16),
                  child: RadioListTile(
                    activeColor: ColorsApp.primaryColor,

                    title: Text(option[0], style: TextStylesApp.font16Black600),
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

                    title: Text(option[1], style: TextStylesApp.font16Black600),
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
            ),
            SizedBox(height: 25),
            CustomButton(onPressed: () {}, title: "Create Account "),
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
    );
  }
}
