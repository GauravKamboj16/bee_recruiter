import 'package:bee_recruiter/constant/app_colors.dart';
import 'package:bee_recruiter/model/job_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendedItem extends StatelessWidget {
  final JobItem jobItem;
  const RecommendedItem({super.key, required this.jobItem});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth / 1.3,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(13),
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: screenWidth / 9,
                width: screenWidth / 9,
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
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
                child: Image.network(
                  jobItem.companyIcon,
                  fit: BoxFit.cover,
                  height: screenWidth / 6,
                  width: screenWidth / 6,
                ),
              ),
              SizedBox(
                width: screenWidth / 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenWidth / 2.4,
                    child: Text(jobItem.profile,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.signupFontColor)),
                  ),
                  Text(jobItem.companyName,
                      style: GoogleFonts.nunito(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyColor)),
                ],
              ),
              Spacer(),
              Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.save_outlined))
            ],
          ),
          SizedBox(
            height: screenWidth / 55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: AppColors.signupIconColor,
              ),
              Text(
                jobItem.location,
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor),
              )
            ],
          ),
          SizedBox(
            height: screenWidth / 39,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.person_outlined,
                color: AppColors.signupIconColor,
              ),
              Text(
                jobItem.appliedBy,
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor),
              )
            ],
          ),
          SizedBox(
            height: screenWidth / 39,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "3d ago",
                style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.signupIconColor),
              ),
              Text("Apply",
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.skyBlueColor))
            ],
          )
        ]),
      ),
    );
  }
}
