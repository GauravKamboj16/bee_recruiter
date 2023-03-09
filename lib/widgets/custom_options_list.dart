import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/app_colors.dart';

class CustomOptionsList extends StatelessWidget {
  final List<String> list;
  final List<String> selctedList;
  final dynamic onTapCallback;

  const CustomOptionsList({super.key, required this.list, required this.selctedList, this.onTapCallback});

  @override
  Widget build(BuildContext context) {
    double screenWidth =MediaQuery.of(context).size.width;
    return   SizedBox(
                  height: screenWidth/10,
                   child: ListView.separated(
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                     return GestureDetector(
                      onTap: onTapCallback,
                      child: itemDesign(list.elementAt(index),selctedList));
                   }, separatorBuilder: (BuildContext context, int index) { 
                    return SizedBox(width: 8,);
                    },)
                 );
  }

  Widget itemDesign(String text,List<String> selctedList){
    return Container(
      padding: const EdgeInsets.fromLTRB(14,8,14,8),
      decoration: BoxDecoration(
        color: selctedList.contains(text)? AppColors.skyBlueColor:AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child:Text(text,style: GoogleFonts.nunito(fontSize: 16,fontWeight:FontWeight.w600,color: AppColors.textColor)),)
    );
  }
  }