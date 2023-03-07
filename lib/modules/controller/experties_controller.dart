import 'package:flutter/cupertino.dart';

class ExpertiesController with ChangeNotifier {
  List<String> expertiesList = [
    "It and Software",
    "Product Designer",
    "Accounting and Finance",
    'Sales and Marketing',
    "Architecture and Engineering",
    "Business Analyst",
    "Writing and Content",
    "Graphic Designer",
    "Product Evangelist",
    "Marketing",
    "Business Developer"
  ];

  List<String> selectedExperties=[];

//this function simply add the selected item to selectedExperties list
// hence item color changes and gets selected

  void addToSelected(String itemName){
    if(selectedExperties.contains(itemName)){
      selectedExperties.remove(itemName);
      notifyListeners();
    }else{
      selectedExperties.add(itemName);
      notifyListeners();
    }
    

  }

}
