import 'dart:async';

import 'package:flutter/material.dart';

class ThemeService {
  StreamController<bool> _themeController = StreamController<bool>();

  Stream<bool> get theme => _themeController.stream;

  changeTheme(bool value) {
    _themeController.add(value);
  }
}
//
final themeService = ThemeService();
