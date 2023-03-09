import 'package:bee_recruiter/model/job_item_model.dart';
import 'package:flutter/cupertino.dart';

class HomePageController with ChangeNotifier{

 // Fake list for Ui testing

 List<String> selctedList=[];
 List<JobItem> jobsList=[
    JobItem(appliedBy: "3 days ago",companyIcon: "https://th.bing.com/th/id/OIP.PWoq1WvDQDxc_MPv4Jt0GwHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    companyName: "Microsoft Inc",profile: "UI/UX Assistant Manager",location: "Gurugram"),
    JobItem(appliedBy: "3 days ago",companyIcon: "https://th.bing.com/th/id/OIP.PWoq1WvDQDxc_MPv4Jt0GwHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    companyName: "Microsoft Inc",profile: "UI/UX Assistant Manager",location: "Gurugram"),
    JobItem(appliedBy: "3 days ago",companyIcon: "https://th.bing.com/th/id/OIP.PWoq1WvDQDxc_MPv4Jt0GwHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    companyName: "Microsoft Inc",profile: "UI/UX Assistant Manager",location: "Gurugram"),
    JobItem(appliedBy: "3 days ago",companyIcon: "https://th.bing.com/th/id/OIP.PWoq1WvDQDxc_MPv4Jt0GwHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    companyName: "Microsoft Inc",profile: "UI/UX Assistant Manager",location: "Gurugram"),
    JobItem(appliedBy: "3 days ago",companyIcon: "https://th.bing.com/th/id/OIP.PWoq1WvDQDxc_MPv4Jt0GwHaHa?w=170&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
    companyName: "Microsoft Inc",profile: "UI/UX Assistant Manager",location: "Gurugram"),
  

 ];


 final List<String> _filterList=["All","Design","Finance","Technology","Marketing"];

 List<String>  get filterList=>_filterList;

 void addToSelected(String item){
  if(selctedList.isEmpty){
    selctedList.add(item.toString());
  notifyListeners();
  }else{
    selctedList=[];
    selctedList.add(item);
    notifyListeners();
  }

 }

}