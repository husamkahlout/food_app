import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_api/providers/auth_provider.dart';
import 'package:food_api/providers/dio_provider.dart';
import 'package:food_api/router/router.dart';
import 'package:food_api/views/screens/home/home_page.dart';
import 'package:food_api/views/screens/auth/login_screen.dart';
import 'package:food_api/views/screens/auth/signup_screen.dart';
import 'package:food_api/views/screens/auth/welcome_screen.dart';
import 'package:food_api/views/theme/theme.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
         ChangeNotifierProvider<DioProvider>(create: (context) => DioProvider()),
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        title: 'Food App',
        debugShowCheckedModeBanner: false,
        theme: lightTheme, 
        home:  WelcomeScreen(),
      ),
    );
  }
}
