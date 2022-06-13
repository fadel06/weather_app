import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/region.dart';

class RegionProvider extends ChangeNotifier {
  final TextEditingController _provinceController = TextEditingController();
  TextEditingController get provinceController => _provinceController;

  Future<List<Region>> getProvinces(String query) async {
    var jsonText =
        await rootBundle.loadString('assets/local_data/provinces.json');
    final List provinces = json.decode(jsonText);
    return provinces.map((json) => Region.fromJson(json)).where((province) {
      final nameLower = province.nama.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  final TextEditingController _regencyController = TextEditingController();
  TextEditingController get regencyController => _regencyController;

  String _provinceId = '';
  String get provinceId => _provinceId;

  void setProvinceId(String newId) {
    _regencyController.text = '';
    _provinceId = newId;
    notifyListeners();
  }

  bool _isRegencyInputEnabled = false;
  bool get isRegencyInputEnabled => _isRegencyInputEnabled;

  void setRegencyInputEnabled(bool isEnabled) {
    _isRegencyInputEnabled = isEnabled;
    notifyListeners();
  }

  Future<List<Region>> getRegencies(String query) async {
    var jsonText =
        await rootBundle.loadString('assets/local_data/$_provinceId.json');
    final List regencies = json.decode(jsonText);
    return regencies.map((json) => Region.fromJson(json)).where((regency) {
      final nameLower = regency.nama.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }
}
