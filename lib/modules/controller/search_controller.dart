import 'package:flutter/cupertino.dart';
//This class consist several Options list used at search Dialog
class SearchController with ChangeNotifier{

 final List<String> _cityList=["Delhi","Gurugram","Banglore","Noida"];
 List<String> get cityList=>_cityList;

  final List<String> _selectedCities=[];
 List<String> get selectedCities=>_selectedCities;



 final List<String> _workType=["On Site","Remote"];
 List<String> get workType=>_workType;

final List<String> _selectedWorkType=[];
 List<String> get selectedWorkType=>_selectedWorkType;


 final List<String> _education=["High School","Diploma"];
 List<String> get education=>_education;
 final List<String> _selectedEducation=[];
 List<String> get selectedEducation=>_selectedEducation;



  final List<String> _education2=["Masters","Bachelors"];
 List<String> get education2=>_education2;
 final List<String> _selectedEducation2=[];
 List<String> get selectedEducation2=>_selectedEducation2;

 final List<String> _jobType=["Full time","Part time","Internship"];
 List<String> get jobType=>_jobType;
 final List<String> _selectedJobType=[];
 List<String> get selectedJobType=>_selectedJobType;


 final List<String> _jobType2=["Contract","Freelance"];
 List<String> get jobType2=>_jobType2;
  final List<String> _selectedJobType2=[];
 List<String> get selectedJobType2=>_selectedJobType2;

 final List<String> _datePosted=["Last 24 Hrs","Last 3 Days" ];
 List<String> get datePosted=>_datePosted;
  final List<String> _selectedDatePosted=[];
 List<String> get selectedDatePosted=>_selectedDatePosted;

  final List<String> _datePosted2=["Last 1 Month","Last 6 Months"];
 List<String> get datePosted2=>_datePosted2;
  final List<String> _selectedDatePosted2=[];
 List<String> get selectedDatePosted2=>_selectedDatePosted2;

 final List<String> _experience=["0-1","2-5","6-10","10+"];
 List<String> get experience=>_experience;




}