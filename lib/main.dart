import 'package:firebase_core/firebase_core.dart';
import 'package:fit_flow_flutter/view/dashboard/dashboard_page.dart';
import 'package:fit_flow_flutter/view/forgot_password_page.dart';
import 'package:fit_flow_flutter/view/login_page.dart';
import 'package:fit_flow_flutter/view/signup_page.dart';
import 'package:fit_flow_flutter/view_model/facebook_sign_in_provider.dart';
import 'package:fit_flow_flutter/view_model/google_sign_in_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'utils/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dep.init();
  runApp(const MyApp());
}

/// Main start
///
/// authors: Jackie, Christoffer & Jakob
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => FacebookSignInProvider(),
        child: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            locale: Locale('da', 'DK'),
            themeMode: ThemeMode.dark,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: LoginPage(),
            getPages: [
              GetPage(name: '/', page: () => LoginPage()),
              GetPage(name: '/signup', page: () => SignupPage()),
              GetPage(name: '/forgot', page: () => ForgotPasswordPage()),
              GetPage(name: '/dashboard', page: () => DashboardPage()),
            ],
          ),
        ),
      );
}
