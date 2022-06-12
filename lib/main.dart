import 'package:flutter/material.dart';
import 'package:weather_app/common/routes.dart';
import 'package:weather_app/common/styles.dart';
import 'package:weather_app/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          primarySwatch: Colors.blue,
          textTheme: myTextTheme,
          appBarTheme: const AppBarTheme(elevation: 0)),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
