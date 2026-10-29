import 'dart:convert';
import 'package:flutter/services.dart';

class TransactionViewModel {
  Future<Map<String, dynamic>> loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);
    return data;
  }
}