import 'package:bee_recruiter/modules/controller/experties_controller.dart';
import 'package:bee_recruiter/modules/controller/forgot_pass_controller.dart';
import 'package:bee_recruiter/modules/controller/recuiter_sign_in_controller.dart';
import 'package:bee_recruiter/modules/controller/reset_pass_controller.dart';
import 'package:bee_recruiter/modules/controller/resume_controller.dart';
import 'package:bee_recruiter/modules/controller/sign_in_controller.dart';
import 'package:bee_recruiter/modules/controller/signup_controller.dart';
import 'package:bee_recruiter/modules/views/signup_screen.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SignupScreen(),
      ),
    );
  }
}
 