import 'package:bee_recruiter/modules/controller/forgot_pass_controller.dart';
import 'package:bee_recruiter/modules/views/verify_otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ForgotPassController>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                Text(AppStrings.forgotPass,
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
                GestureDetector(
                    onTap: () {
                      _controller.switchToSms();
                    },
                    child: resetMethodContainer(
                        _controller.isSmsSelcted == true,
                        Icons.message,
                        "Via SMS",
                        "+91999*****94")),
                SizedBox(
                  height: screenWidth / 15,
                ),
                GestureDetector(
                    onTap: () {
                      _controller.switchToMail();
                    },
                    child: resetMethodContainer(_controller.isMailSelected,
                        Icons.mail, "Via SMS", "aya********na@gmail.com")),
                SizedBox(
                  height: screenWidth / 15,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return VerifYOTPScreen();
                  })),
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
        )),
      ),
    );
  }

  Widget resetMethodContainer(
      bool isSelected, IconData icon, String via, String sendTo) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: MediaQuery.of(context).size.height / 8,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              width: 1,
              strokeAlign: StrokeAlign.outside,
              color: isSelected == true
                  ? AppColors.signUpButtonBlue
                  : AppColors.backgroundColor),
          boxShadow: const [
            BoxShadow(
                color: AppColors.signupIconColor,
                blurRadius: 1,
                offset: Offset(0.5, 0.5)),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth / 16,
          ),
          Container(
            height: screenWidth / 6,
            width: screenWidth / 6,
            decoration: const BoxDecoration(
                color: AppColors.lighestBlue, shape: BoxShape.circle),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.signUpButtonBlue,
              ),
            ),
          ),
          SizedBox(
            width: screenWidth / 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                via,
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.signupIconColor),
              ),
              Text(
                sendTo,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.signupFontColor),
              ),
            ],
          )
        ],
      ),
    );
  }
}
