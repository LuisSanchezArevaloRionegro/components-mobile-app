import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class _ProviderMenu {
  List<dynamic> options = [];

  _ProviderMenu() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    options = dataMap['rutas'];

    return options;
  }
}

final providerMenu = new _ProviderMenu();
