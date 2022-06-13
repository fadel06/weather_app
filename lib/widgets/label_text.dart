import 'package:flutter/cupertino.dart';
import 'package:weather_app/common/styles.dart';

Padding labelText(
  String text,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
    child: Text(
      text,
      style: myTextTheme.subtitle1?.apply(color: kPrimaryDarkColor),
    ),
  );
}
