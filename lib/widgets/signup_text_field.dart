import 'package:bee_recruiter/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final IconData? suffixIcon;
  final TextInputType textInputType;
  final bool isTextObscure;
  final FormFieldValidator<String> validator;

  final dynamic onTapCallback;
  const SignUpTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      required this.textInputType,
      this.suffixIcon,
      this.onTapCallback,
      required this.isTextObscure,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      obscureText: isTextObscure,
      style: GoogleFonts.nunito(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.signupFontColor),
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          size: 18,
        ),
        suffixIcon: IconButton(
            icon: Icon(
              suffixIcon,
              color: AppColors.signupIconColor,
            ),
            onPressed: onTapCallback),
        suffixIconColor: AppColors.signupIconColor,
        hintText: hint,
        hintStyle:
            GoogleFonts.nunito(color: AppColors.signupIconColor, fontSize: 16),
        prefixIconColor: AppColors.signupIconColor,
        fillColor: AppColors.signTFBackground,
        filled: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.signTFBackground)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.signTFBackground)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.signTFBackground)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppColors.signTFBackground)),
      ),
    );
  }
}
