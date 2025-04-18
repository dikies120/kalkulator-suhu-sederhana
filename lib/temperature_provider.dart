import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {
  String input = "";
  String selectedFrom = "Celsius";
  String selectedTo = "Fahrenheit";
  String result = "";

  final List<String> units = ["Celsius", "Fahrenheit", "Kelvin"];

  void updateInput(String value) {
    input += value;
    notifyListeners();
  }

  void deleteInput() {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
      notifyListeners();
    }
  }

  void reset() {
    input = "";
    result = "";
    notifyListeners();
  }

  void setSelectedFrom(String value) {
    selectedFrom = value;
    notifyListeners();
  }

  void setSelectedTo(String value) {
    selectedTo = value;
    notifyListeners();
  }

  void convert() {
    double? inputValue = double.tryParse(input);
    if (inputValue == null) {
      result = "Masukkan angka yang valid";
    } else {
      double converted = _convertTemperature(inputValue, selectedFrom, selectedTo);
      result = "$inputValue $selectedFrom = ${converted.toStringAsFixed(2)} $selectedTo";
    }
    notifyListeners();
  }

  double _convertTemperature(double value, String from, String to) {
    if (from == to) return value;
    double celsius;
    if (from == "Celsius") {
      celsius = value;
    } else if (from == "Fahrenheit") {
      celsius = (value - 32) * 5 / 9;
    } else {
      celsius = value - 273.15;
    }

    if (to == "Celsius") return celsius;
    if (to == "Fahrenheit") return (celsius * 9 / 5) + 32;
    return celsius + 273.15;
  }
}
