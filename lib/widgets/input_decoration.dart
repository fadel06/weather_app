import 'package:flutter/material.dart';

import '../common/styles.dart';

InputDecoration textInputDecoration(
  String hint,
) {
  return InputDecoration(
    filled: true,
    isDense: true,
    hintText: hint,
    hintStyle: const TextStyle(color: Colors.white),
    contentPadding: const EdgeInsets.all(16.0),
    border: OutlineInputBorder(
        borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16)),
    fillColor: kPrimaryLightColor.withOpacity(.3),
  );
}
