import 'package:bee_recruiter/constant/app_colors.dart';
import 'package:bee_recruiter/modules/controller/home_screen_controller.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   

  

  @override
  Widget build(BuildContext context) {
    final controller =Provider.of<HomeScreenController>(context);
    return Scaffold(

      body:  HomeScreenController.widgetOptions.elementAt(controller.activeIndex),


      bottomNavigationBar: 
          CurvedNavigationBar(
            items:controller.itemList,
            backgroundColor:Colors.transparent,
            //Color(0xff4527a0),
            buttonBackgroundColor:AppColors.skyBlueColor,
            color:AppColors.backgroundColor,
            index: controller.activeIndex,
            onTap:controller.itemClick,
            height: 50,
          ),
 

    );
  }
}