import 'package:background_app/views/splash_view.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.white),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
