import 'package:bee_recruiter/modules/views/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';

class VerifYOTPScreen extends StatefulWidget {
  const VerifYOTPScreen({super.key});

  @override
  State<VerifYOTPScreen> createState() => _VerifYOTPScreenState();
}

class _VerifYOTPScreenState extends State<VerifYOTPScreen> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  height: screenWidth / 8,
                ),
                Text(AppStrings.verifyNumber,
                    style: GoogleFonts.nunito(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textColor)),
                SizedBox(
                  height: screenWidth / 36,
                ),
                Text(
                    textAlign: TextAlign.center,
                    AppStrings.verifySentOtp,
                    style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    )),
                SizedBox(
                  height: screenWidth / 6
                  
                  ,
                ),
                // Implement 4 input fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CodeTextField(context, _fieldOne, true,false), // auto focus
                    CodeTextField(context, _fieldTwo, false,false),
                    CodeTextField(context, _fieldThree, false,false),
                    CodeTextField(context, _fieldFour, false,true),
                  ],
                ),

                SizedBox(
                  height: screenWidth / 10,
                ),
                RichText(
                  overflow: TextOverflow.fade,
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 36),
                    children: <TextSpan>[
                      TextSpan(
                          text: AppStrings.didNotRec,
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor)),
                      TextSpan(
                          text: AppStrings.resend,
                          style: GoogleFonts.nunito(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.orange))
                    ],
                  ),
                ),
                SizedBox(
                  height: screenWidth / 15,
                ),
                GestureDetector(
                  onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context){
                    return const ResetPassword(); })),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CodeTextField(BuildContext context, var controller, var _autoFocus,bool isLast) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        style: GoogleFonts.nunito(fontSize: 24,fontWeight: FontWeight.w700,color: AppColors.signupFontColor),
        autofocus: _autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: AppColors.signUpButtonBlue,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            focusedBorder:  UnderlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {

            if(isLast!=true){
              FocusScope.of(context).nextFocus();
            }else{
              FocusScope.of(context).unfocus();
            }
            
          }
        },
      ),
    );
  }
}
