import 'package:bee_recruiter/model/job_item_model.dart';
import 'package:bee_recruiter/modules/controller/experties_controller.dart';
import 'package:bee_recruiter/modules/controller/forgot_pass_controller.dart';
import 'package:bee_recruiter/modules/controller/home_page_controller.dart';
import 'package:bee_recruiter/modules/controller/home_screen_controller.dart';
import 'package:bee_recruiter/modules/controller/recuiter_sign_in_controller.dart';
import 'package:bee_recruiter/modules/controller/reset_pass_controller.dart';
import 'package:bee_recruiter/modules/controller/resume_controller.dart';
import 'package:bee_recruiter/modules/controller/search_controller.dart';
import 'package:bee_recruiter/modules/controller/sign_in_controller.dart';
import 'package:bee_recruiter/modules/controller/signup_controller.dart';
import 'package:bee_recruiter/modules/views/forgot_password.dart';
import 'package:bee_recruiter/modules/views/home_page.dart';
import 'package:bee_recruiter/modules/views/home_screen.dart';
import 'package:bee_recruiter/modules/views/reset_password.dart';
import 'package:bee_recruiter/modules/views/signup_screen.dart';
import 'package:bee_recruiter/widgets/recommended_job_item.dart';
import 'package:bee_recruiter/widgets/search_dailog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
      return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ForgotPassController()),
        ChangeNotifierProvider(create: (_) => SignInController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => ResetPassController()),
        ChangeNotifierProvider(create: (_) => RecruiterSignInController()),
        ChangeNotifierProvider(create: (_) => ExpertiesController()),
        ChangeNotifierProvider(create: (_) => ResumeController()),
        ChangeNotifierProvider(create: (_) => HomePageController()),
        ChangeNotifierProvider(create: (_) => HomeScreenController()),
        ChangeNotifierProvider(create: (_) => SearchController()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:const HomeScreen(),
      ),
    );
  }

}
 