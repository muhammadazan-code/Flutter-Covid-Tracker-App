import 'package:covid_app/services/routes/routes_name.dart';
import 'package:covid_app/services/routes_services.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: RoutesServices.generateRoute,
      title: 'Covid app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}
