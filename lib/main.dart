import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hire_harmony/utils/app_theme.dart';
import 'package:hire_harmony/views/pages/custom_buttom_navbar.dart';
import 'package:hire_harmony/views/pages/employeePages/emp_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),

      home:CustomButtomNavbar(),
      /*const EmpSignUp(stepText: "Step 1: Upload the front of your ID"),*/
      /* const VerificationSuccessPage(
      /*  notificationTitle:'Phone Number Verification Successful',
        notificationMessage:'Your phone number has been verified successfully!',*/
        notificationTitle:'Password Reset Successful',
        notificationMessage:'Your password has been successfully reset. You can now log in with your new password.',
        
        ),
      */
    );
  }
}
