import 'package:bee_recruiter/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight/15,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
           color: AppColors.greyBorder,
           width: 1
        ),
          boxShadow: const [
            BoxShadow(
                color: AppColors.cardColor,
                blurRadius: 0.1,
                offset: Offset(0.3, 0.3)),
            BoxShadow(
                color: AppColors.cardColor,
                blurRadius: 0.1,
                offset: Offset(-0.3, -0.3)),
          ]
      ),

      child: Row(
        children: [
          SizedBox(
            width: screenWidth/30,
          ),
          Icon(Icons.search_outlined,color: AppColors.blackColor,),
          SizedBox(
            width: screenWidth/30,
          ),
          SizedBox(
            width: screenWidth/2,
            height: screenHeight/20,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find your dream job..",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none
                           ),
            ),
          ),
          Spacer(),
           Icon(Icons.sort,color: AppColors.blackColor,),
           SizedBox(
            width: screenWidth/30,
          ),
          
        ],
      ),
    );
  }
}