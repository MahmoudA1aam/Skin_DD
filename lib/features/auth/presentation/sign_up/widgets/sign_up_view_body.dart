import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:skin_dd/features/auth/data/models/sign_up_model/sign_up_request_model.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/cubits/sign_up_cubit.dart';
import 'package:skin_dd/features/auth/presentation/sign_up/widgets/password_vaildation.dart';

import '../../../../../core/helper/app_regex.dart';

import '../../../../../core/theming/text_style_app.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_from_field.dart';
import '../../../../profile/presentation/widgets/image_profile_widget.dart';
import '../../login/widgets/have_account.dart';
import 'image_profile_sign_up.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController firestnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  DateTime? _selectedDate;
  bool obscureText = true;
  List<String> option = ["Male", "Female"];
  String? currentvalue;
  bool ischeked1 = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  String? profileImageBase64;
  late XFile imageFile;

  @override
  void initState() {
    setupPasswordControllerListener();
    imageFile = XFile('');
    // TODO: implement initState
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        birthdayController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
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
    var mediaQuery = MediaQuery.of(context).size;
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

              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  showImagePickerOptions(context);
                },
                child: ImageProfileSignUp(image: imageFile),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: mediaQuery.width * 0.45,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter a valid name";
                        }
                      },
                      hintText: "firest name",
                      controller: firestnamecontroller,
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.width * 0.45,
                    child: CustomTextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "please enter a valid name";
                        }
                      },
                      hintText: "last name",
                      controller: lastnamecontroller,
                    ),
                  ),
                ],
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
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                controller: emailcontroller,
              ),
              const SizedBox(height: 24),
              CustomTextFormField(
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                readOnly: true,
                ontap: () => _selectDate(context),

                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().isEmpty ||
                      !AppRegex.hasNumber(value)) {
                    return "please enter a valid email";
                  }
                },
                hintText: "birth date",
                controller: birthdayController,
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

              SizedBox(height: 25),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SignUpRequestModel signUpModel = SignUpRequestModel(
                      birthdate: birthdayController.text,
                      email: emailcontroller.text,
                      lastName: lastnamecontroller.text,
                      firstName: firestnamecontroller.text,
                      password: passwordController.text,
                      profileImage: profileImageBase64,
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
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  void showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext modalContext) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Select from Gallery'),
                onTap: () {
                  // أغلق القائمة أولاً ثم اختر الصورة
                  Navigator.of(modalContext).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () {
                  // أغلق القائمة أولاً ثم التقط الصورة
                  Navigator.of(modalContext).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      final bytes = await File(image.path).readAsBytes();
      final imageEncode = base64Encode(bytes);

      setState(() {
        imageFile = image;
        profileImageBase64 = imageEncode; // <-- هنا يتم استخدام المتغير الجديد
      });
    }
  }
}

// تعريف navigatorKey (ضروري في مكان ما في التطبيق)
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
