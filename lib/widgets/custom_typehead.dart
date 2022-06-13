import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../common/styles.dart';
import '../models/region.dart';
import 'input_decoration.dart';

Widget customTypeAhead(
    String hintText,
    TextEditingController controller,
    FutureOr<Iterable<Region?>> Function(String) suggestionsCallback,
    Function(Region?) onSuggestionSelected,
    String errorMessage) {
  return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: TypeAheadFormField<Region?>(
        textFieldConfiguration: TextFieldConfiguration(
            style: const TextStyle(color: kPrimaryColor),
            cursorColor: kPrimaryColor,
            textCapitalization: TextCapitalization.characters,
            decoration: textInputDecoration(hintText),
            controller: controller),
        suggestionsCallback: suggestionsCallback,
        itemBuilder: (context, Region? suggestion) {
          return ListTile(
            title: Text(suggestion!.nama),
          );
        },
        onSuggestionSelected: onSuggestionSelected,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          }
          return null;
        },
      ));
}
