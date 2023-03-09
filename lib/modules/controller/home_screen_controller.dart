import 'package:bee_recruiter/constant/app_colors.dart';
import 'package:bee_recruiter/modules/views/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/feed_screen.dart';

class HomeScreenController with ChangeNotifier {
  int _activeIndex = 0;
  int get activeIndex => _activeIndex;


  //This method is for switching pages while user click on bottom Navigation Items
  static const List<Widget> widgetOptions = <Widget>[
    HomePage(),
    Center(
        child: Text('Saved Jobs',
            style: TextStyle(fontSize: 15, ))),
    Center(
        child: Text('resume Page',
            style: TextStyle(fontSize: 15, ))),
    Center(
        child: Text('Calender Page',
            style: TextStyle(fontSize: 15, ))),
    FeedScreen()
  ];


// List of icons that we are using in Bottom navigation bar
  final itemList = [
    const Icon(
      Icons.home_outlined,
      size: 30,
      color: AppColors.signupIconColor,
    ),
    const Icon(
      Icons.save,
      size: 30,
      color: AppColors.signupIconColor,
    ),
    const Icon(
      Icons.note,
      size: 30,
      color: AppColors.signupIconColor,
    ),
    const Icon(
      Icons.calendar_month_outlined,
      size: 30,
      color: AppColors.signupIconColor,
    ),
    const Icon(
      Icons.feed_outlined,
      size: 30,
      color: AppColors.signupIconColor,
    ),
  ];

  //This method is called to change the current active index
  void itemClick(int value) {
    _activeIndex = value;
    notifyListeners();
  }
}
