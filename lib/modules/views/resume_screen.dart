import 'package:bee_recruiter/modules/controller/resume_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';
import '../../widgets/option_container.dart';

class ResumeScreen extends StatefulWidget {
  const ResumeScreen({super.key});

  @override
  State<ResumeScreen> createState() => _ResumeScreenState();
}

class _ResumeScreenState extends State<ResumeScreen> {
  @override
  Widget build(BuildContext context) {
    final _controller=Provider.of<ResumeController>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
            Text(AppStrings.whatsExperties,
                style: GoogleFonts.nunito(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textColor)),
            SizedBox(
              height: screenWidth / 36,
            ),
            Text(AppStrings.selectJobInterest,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor)),
                    SizedBox(height: screenWidth/40,),
            const Divider(
              color: AppColors.signupIconColor,
              height: 0.5,
               
            ),        
             SizedBox(height: screenWidth/20,),
               GestureDetector(
                onTap: () {
                  _controller.switchOption();
                },
                child: OptionContainer(icon: Icons.note,title:AppStrings.createResume ,desc: AppStrings.createResumeDesc,isSelected: _controller.isCreating,)),
             SizedBox(height: screenWidth/20,),
             GestureDetector(
              onTap: () => _controller.switchOption(),
              child: OptionContainer(icon: Icons.upload,title: AppStrings.uploadResumeDesc,desc: AppStrings.uploadResume,isSelected:_controller.isUploading ,)),
             SizedBox(height: screenWidth/20,),
            Container(
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
            SizedBox(
              height: screenWidth / 29,
            ),
          ],
        ),
      )),
    );
  }

  Widget itemDesign(var name, var controller) {
    return Container(
      height: MediaQuery.of(context).size.height / 8.5,
      // ignore: sort_child_properties_last
      child: Stack(children: [
        Positioned(
          right: 0.2,
          child: controller.selectedExperties.contains(name)
              ? Checkbox(
                  activeColor: AppColors.backgroundColor,
                  checkColor: AppColors.signUpButtonBlue,
                  value: true,
                  onChanged: (val) {})
              : const SizedBox(
                  height: 1,
                ),
        ),
        Positioned(
            left: 8,
            bottom: 5,
            right: 4,
            child: Text(
              name,
              textAlign: TextAlign.left,
              style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: controller.selectedExperties.contains(name)
                      ? AppColors.backgroundColor
                      : AppColors.signupFontColor),
            )),
      ]),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: controller.selectedExperties.contains(name)
              ? AppColors.signUpButtonBlue
              : AppColors.backgroundColor,
          border: Border.all(color: AppColors.signUpButtonLBlue, width: 0.2),
          boxShadow: const [
            BoxShadow(
                color: AppColors.cardColor,
                blurRadius: 0.1,
                offset: Offset(0.3, 0.3)),
            BoxShadow(
                color: AppColors.cardColor,
                blurRadius: 0.1,
                offset: Offset(-0.3, -0.3)),
          ]),
    );
  }
}
