import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:scr/Screens/form.dart';
import 'package:scr/Screens/payment.dart';
import 'package:scr/main_page.dart';
import 'package:scr/models/firebase_options.dart';
import 'package:scr/Auth/login.dart';
import 'package:scr/Auth/register.dart';
import 'package:scr/sports%20bike/home_page/home%20page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DarkModeMotorcyclesApp());
}

class DarkModeMotorcyclesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue, brightness: Brightness.dark),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routName: (_) => HomePage(),
        Login.routeName: (_) => Login(),
        Register.routeName: (_) => Register(),
        MainPage.routeName: (_) => MainPage(),
        PaymentPage.routname:(_)=>PaymentPage(),
        AddressFormPage.routname:(_)=> AddressFormPage(),
        MainPage.routeName:(_)=>MainPage(),

      },
    );
  }
}
