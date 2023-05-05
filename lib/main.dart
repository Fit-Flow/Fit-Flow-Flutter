import 'package:fit_flow_flutter/view/dashboard/dashboard_page.dart';
import 'package:fit_flow_flutter/view/forgot_password_page.dart';
import 'package:fit_flow_flutter/view/login_page.dart';
import 'package:fit_flow_flutter/view/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}
/**
 *
 * @author Jackie
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        "/": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/forgot": (context) => ForgotPasswordPage(),
        "/dashboard": (context) => DashboardPage()
      },
    );
  }
}
