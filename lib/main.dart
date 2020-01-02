import 'package:flutter/material.dart';
import 'package:wisatah_malang/routes/routes.dart';
import 'package:wisatah_malang/widget/home.dart';

void main(){
  Routes.createRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisatah Malang',
      onGenerateRoute: Routes.sailor.generator(),
      navigatorKey: Routes.sailor.navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(),
        fontFamily: "Sans"
      ),
      home: Home(),
    );
  }
}

