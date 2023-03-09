import 'package:bee_recruiter/init/validator.dart';
import 'package:bee_recruiter/modules/controller/reset_pass_controller.dart';
import 'package:bee_recruiter/widgets/signup_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  InputValidator validator = InputValidator();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ResetPassController>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: screenWidth / 8,
                      decoration: BoxDecoration(
                          color: AppColors.iconBackground,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.blackColor,
                            size: 23,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth / 35,
                  ),
                  Text(AppStrings.resetPassword,
                      style: GoogleFonts.nunito(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textColor)),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  Text(AppStrings.forgotPassDetail,
                  textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor)),
                  SizedBox(
                    height: screenWidth / 10,
                  ),
                  SvgPicture.asset(
                    "assets/images/forgot_password.svg",
                    height: screenHeight / 5,
                  ),
                  SizedBox(
                    height: screenWidth / 15,
                  ),
                  SignUpTextField(
                    controller: passController,
                    hint: "New Password",
                    icon: Icons.lock_rounded,
                    textInputType: TextInputType.text,
                    suffixIcon: _controller.isPassVisible == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isTextObscure:
                        _controller.isPassVisible == true ? false : true,
                    onTapCallback: () => _controller.showPass(),
                    validator: (String? value) {
                      return validator.validatePassword(value!);
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 15,
                  ),
                  SignUpTextField(
                    controller: confirmPassController,
                    hint: "Confirm Password",
                    icon: Icons.lock_outline,
                    textInputType: TextInputType.text,
                    isTextObscure:
                        _controller.isConfrimPassVisi == true ? false : true,
                    suffixIcon: _controller.isConfrimPassVisi == true
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onTapCallback: () => _controller.showConfirmPass(),
                    validator: (String? value) {
                      return validator.validateConfirmPassword(
                          value!, passController.text);
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            AppStrings.passValidation,
                            style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: AppColors.validationFont),
                          ),
                          Spacer()
                        ],
                      ),
                      SizedBox(
                        height: screenWidth / 55,
                      ),
                      Text(
                        AppStrings.useNumbers,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.validationFont),
                      ),
                      SizedBox(
                        height: screenWidth / 55,
                      ),
                      Text(
                        AppStrings.useSymbols,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.validationFont),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenWidth / 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print("All Ok");
                      } else {
                        print("invalid");
                      }
                    },
                    child: Container(
                      height: screenHeight / 14,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.signUpButtonBlue,
                                AppColors.signUpButtonLBlue
                              ])),
                      child: Center(
                        child: Text(
                          AppStrings.nContinue,
                          style: GoogleFonts.nunito(
                              color: AppColors.backgroundColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenWidth / 29,
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
