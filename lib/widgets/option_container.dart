import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_colors.dart';

class OptionContainer extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final String title;
  final String desc;
  const OptionContainer({super.key, required this.icon, required this.isSelected, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
     // double screenHeight=MediaQuery.of(context).size.height;
     double screenWidth=MediaQuery.of(context).size.width;

    return Container(
      height: MediaQuery.of(context).size.height/8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          strokeAlign: StrokeAlign.outside,
          color: isSelected==true?AppColors.signUpButtonBlue:AppColors.backgroundColor
        ),
        boxShadow: const[
          BoxShadow(
            color: AppColors.signupIconColor,
            blurRadius: 1,
            offset: Offset(0.5, 0.5)
          ),
          
        ]
    
      ),
      child: Row(
        children: [
           SizedBox(width: screenWidth/16,),
          Container(
            height:screenWidth/6 ,
            width:screenWidth/6 ,
            decoration:const BoxDecoration(
              color: AppColors.lighestBlue,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Icon(icon,color: AppColors.signUpButtonBlue,),
            ),
          ),
          SizedBox(width: screenWidth/25,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,textAlign: TextAlign.start, style: GoogleFonts.nunito(fontSize:16,fontWeight: FontWeight.w700,color: AppColors.signupFontColor),),
                Text(desc,textAlign: TextAlign.start,style: GoogleFonts.nunito(fontSize:12,fontWeight: FontWeight.w500,color: AppColors.signupIconColor),),
                
              
              ],
            ),
          )
        ],
      ),
    );

  }
}