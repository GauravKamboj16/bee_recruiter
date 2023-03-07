import 'package:bee_recruiter/modules/controller/experties_controller.dart';
import 'package:bee_recruiter/modules/views/resume_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../constant/app_colors.dart';
import '../../constant/app_strings.dart';

class ExpertiesScreen extends StatefulWidget {
  const ExpertiesScreen({super.key});

  @override
  State<ExpertiesScreen> createState() => _ExpertiesScreenState();
}

class _ExpertiesScreenState extends State<ExpertiesScreen> {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<ExpertiesController>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(16),
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
            SizedBox(
              height: screenWidth / 40,
            ),
            _controller.selectedExperties.isEmpty
                ? SizedBox(
                    height: screenWidth / 20,
                  )
                : Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      "${_controller.selectedExperties.length}/${_controller.expertiesList.length} Selected",
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.greenColor),
                    ),
                  ),
            SizedBox(
              height: screenWidth / 40,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: _controller.expertiesList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: screenHeight / 8.5),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          _controller.addToSelected(
                              _controller.expertiesList.elementAt(index));
                        },
                        child: itemDesign(
                            _controller.expertiesList.elementAt(index),
                            _controller));
                  }),
            ),
            GestureDetector(
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ResumeScreen();
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
