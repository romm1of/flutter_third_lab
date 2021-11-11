import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_third_lab/page/HomePage.dart';

import './globalStateManagement/StateUserValue.dart';

Future<void> main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>StateUserValue())
    ],child:MyApp())
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "OpenSans",
          primaryColor: Color(0xFF075E54),
          accentColor: Color(0xFF128C7E)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
