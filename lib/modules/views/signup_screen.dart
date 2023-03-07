import 'package:bee_recruiter/constant/app_colors.dart';
import 'package:bee_recruiter/constant/app_strings.dart';
import 'package:bee_recruiter/init/validator.dart';
import 'package:bee_recruiter/modules/views/sign_in_screen.dart';
import 'package:bee_recruiter/widgets/signup_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../controller/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  InputValidator validator = InputValidator();
  
    final fNameController = TextEditingController();
    final lNameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<SignupController>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    print("build");
    

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
                          onPressed: () {},
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
                  SvgPicture.asset(
                    "assets/images/sign_up.svg",
                    height: screenHeight / 8,
                    
                  ),
                  SizedBox(
                    height: screenWidth / 35,
                  ),
                  Text(AppStrings.signup,
                      style: GoogleFonts.nunito(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textColor)),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  Text(AppStrings.signUpDetailsText,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor)),
                  SizedBox(
                    height: screenWidth / 26,
                  ),
                  SignUpTextField(
                    controller: fNameController,
                    hint: "First Name",
                    icon: Icons.person_outline,
                    isTextObscure: false,
                    textInputType: TextInputType.name,
                    validator: (String? value) {
                      return validator.emptyString(value, "first name");
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  SignUpTextField(
                    controller: lNameController,
                    hint: "Last Name",
                    icon: Icons.person_outline,
                    isTextObscure: false,
                    textInputType: TextInputType.name,
                    validator: (String? value) {
                      return validator.emptyString(value, "last name");
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  SignUpTextField(
                    controller: phoneController,
                    hint: "Phone Number",
                    icon: Icons.phone_outlined,
                    isTextObscure: false,
                    textInputType: TextInputType.phone,
                    validator: (String? value) {
                      return validator.validateMobile(value!);
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  SignUpTextField(
                    controller: emailController,
                    hint: "Email",
                    icon: Icons.email,
                    isTextObscure: false,
                    textInputType: TextInputType.emailAddress,
                    validator: (String? value) {
                      return validator.emailValidate(value);
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  SignUpTextField(
                    controller: locationController,
                    hint: "Location",
                    icon: Icons.location_on_outlined,
                    isTextObscure: false,
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      return validator.emptyString(value, "location");
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 33,
                  ),
                  Consumer<SignupController>(
                    builder: (context, nController, child) {
                      return

                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: const Color(0xff2193B0),
                            value: nController.isTnCSelected,
                            onChanged: (value) {
                              nController.changeCheckBoxVal(value!);
                            }),
                        Expanded(
                          child: RichText(
                            overflow: TextOverflow.fade,
                            text: TextSpan(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 36),
                              children: <TextSpan>[
                                TextSpan(
                                    text: AppStrings.termsAndCondText,
                                    style: GoogleFonts.nunito(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.blackColor)),
                                TextSpan(
                                    text: AppStrings.termsAndCondText1,
                                    style: GoogleFonts.nunito(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.textColor))
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                    }
                  ),
                  SizedBox(
                    height: screenWidth / 29,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        print("Signup OK");
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
                          AppStrings.signup,
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
                  Text(AppStrings.orContinue,
                      style:
                          GoogleFonts.nunito(color: AppColors.signupIconColor)),
                  SizedBox(
                    height: screenWidth / 29,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/fb_logo.png",
                        height: screenWidth / 9,
                        width: screenWidth / 9,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: screenWidth / 45,
                      ),
                      SvgPicture.asset(
                        "assets/images/li_logo.svg",
                        height: screenWidth / 9,
                        width: screenWidth / 9,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: screenWidth / 45,
                      ),
                      SvgPicture.asset(
                        "assets/images/google_logo.svg",
                        height: screenWidth / 9,
                        width: screenWidth / 9,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenWidth / 29,
                  ),
                  RichText(
                    overflow: TextOverflow.fade,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppStrings.alreadyMember,
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.signupIconColor)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("Tapped");
                                Navigator.push(context,
                                    MaterialPageRoute(builder: ((context) {
                                  return const SignInScreen();
                                })));
                              },
                            text: AppStrings.signin,
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textColor))
                      ],
                    ),
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
