import 'package:flutter/cupertino.dart';
import 'package:weather_app/views/home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: ((context) => const HomeScreen())
};
