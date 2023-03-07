import 'package:bee_recruiter/init/validator.dart';
import 'package:bee_recruiter/modules/controller/recuiter_sign_in_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';
import '../../widgets/signup_text_field.dart';
import 'forgot_password.dart';

class RecruiterSignIn extends StatefulWidget {
  const RecruiterSignIn({super.key});

  @override
  State<RecruiterSignIn> createState() => _RecruiterSignInState();
}

class _RecruiterSignInState extends State<RecruiterSignIn> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final validator=InputValidator();
  final  _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _controller=Provider.of<RecruiterSignInController>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Stack(
        children:[ 
          SvgPicture.asset('assets/images/corner_vector.svg'),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
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
                  ),
                    SizedBox(
                    height: screenWidth / 35,
                  ),
                  SvgPicture.asset(
                    "assets/images/sign_up.svg",
                    height: screenHeight / 7,
                  ),
                  SizedBox(
                    height: screenWidth / 35,
                  ),
                  Text(AppStrings.signin,
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
                      controller: emailController,
                      hint: "Email Id",
                      icon: Icons.mail,
                      isTextObscure: false,
                      
                      textInputType: TextInputType.emailAddress, validator: (String? value) {
                        return validator.emailValidate(value);
                        },),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                 SignUpTextField(
                    controller:passController ,
                    hint: "Password",
                    icon: Icons.lock_outline,
                    suffixIcon: _controller.isPassVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    isTextObscure:
                        _controller.isPassVisible == true ? false : true,
                    textInputType: TextInputType.visiblePassword,
                    onTapCallback: () {
                      _controller.showPass();
                    },
                    validator: (String? value) {
                      
                      return validator.emptyString(value!,"Password");
                    },
                  ),
                  SizedBox(
                    height: screenWidth / 36,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      GestureDetector(
                          onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ForgotPassword();
                              })),
                          child: Text(
                            AppStrings.forgotPass + "?",
                            style: GoogleFonts.nunito(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.redColor),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: screenWidth / 13,
                  ),
                  GestureDetector(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        print("Sign in done");

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
                          AppStrings.signin,
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
                    height: screenWidth / 25,
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
                      Image.asset(
                        "assets/images/li_logo.png",
                        height: screenWidth / 9,
                        width: screenWidth / 9,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: screenWidth / 45,
                      ),
                      Image.asset(
                        "assets/images/google_logo.png",
                        height: screenWidth / 9,
                        width: screenWidth / 9,
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenWidth / 20,
                  ),
                  RichText(
                    overflow: TextOverflow.fade,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppStrings.notRegistered,
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.signupIconColor)),
                        TextSpan(
                            text: AppStrings.signup,
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
          ),
        ]
          ),
        ),
      ),
    );
  }
}
