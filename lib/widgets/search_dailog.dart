import 'package:bee_recruiter/constant/app_strings.dart';
import 'package:bee_recruiter/modules/controller/search_controller.dart';
import 'package:bee_recruiter/widgets/custom_options_list.dart';
import 'package:bee_recruiter/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constant/app_colors.dart';

class SearchDailog extends StatelessWidget {
  const SearchDailog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Provider.of<SearchController>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return   Positioned(
      top: 50,
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Location",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.w700,color: AppColors.textColor),),
                  SizedBox(height: screenWidth/40,),
                  const CustomSearchBar(),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list: controller.cityList,selctedList: controller.selectedCities),
                  SizedBox(height: screenWidth/15,),
                  Text("Work Type",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.w700,color: AppColors.textColor),),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.workType,selctedList: controller.selectedWorkType),
                  SizedBox(height: screenWidth/15,),
                  Text("Job Type",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.w700,color: AppColors.textColor),),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.jobType,selctedList: controller.selectedJobType),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.jobType2,selctedList: controller.selectedJobType2),
                  SizedBox(height: screenWidth/30,),
                  Text("Education",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.w700,color: AppColors.textColor),),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.education,selctedList: controller.selectedEducation),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.education2,selctedList: controller.selectedEducation2),
                  SizedBox(height: screenWidth/30,),
                  Text("Date Posted",style: GoogleFonts.nunito(fontSize: 18,fontWeight:FontWeight.w700,color: AppColors.textColor),),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.datePosted,selctedList: controller.selectedDatePosted),
                  SizedBox(height: screenWidth/30,),
                  CustomOptionsList(list:controller.datePosted2,selctedList: controller.selectedDatePosted2),
                   
                
                ],
              ),
            ),
          
        ),
      ),
    );
  }

  

 
}