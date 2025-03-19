import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
<<<<<<< HEAD
  const MyHomePage({super.key, this.title = "Temperature Converter"});
=======
  const MyHomePage({super.key, required this.title});
>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _input = "";
  String _selectedFrom = "Celsius";
  String _selectedTo = "Fahrenheit";
  String _result = "";

  final List<String> _units = ["Celsius", "Fahrenheit", "Kelvin"];

  double convertTemperature(double value, String from, String to) {
    if (from == to) return value;

    double celsius;
    if (from == "Celsius") {
      celsius = value;
    } else if (from == "Fahrenheit") {
      celsius = (value - 32) * 5 / 9;
    } else {
      celsius = value - 273.15;
    }

    if (to == "Celsius") {
      return celsius;
    } else if (to == "Fahrenheit") {
      return (celsius * 9 / 5) + 32;
    } else {
      return celsius + 273.15;
    }
  }

  void _convert() {
    setState(() {
      double? inputValue = double.tryParse(_input);
      if (inputValue == null) {
        _result = "Masukkan angka yang valid";
      } else {
        double convertedValue = convertTemperature(inputValue, _selectedFrom, _selectedTo);
        _result = "$inputValue $_selectedFrom = ${convertedValue.toStringAsFixed(2)} $_selectedTo";
      }
    });
  }

  void _onNumberPressed(String number) {
    setState(() {
      _input += number;
    });
  }

  void _onDelete() {
    setState(() {
      if (_input.isNotEmpty) {
        _input = _input.substring(0, _input.length - 1);
      }
    });
  }

  void _onReset() {
    setState(() {
      _input = "";
      _result = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _input.isEmpty ? "Masukkan suhu" : _input,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
<<<<<<< HEAD
=======

>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dari:", style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  value: _selectedFrom,
                  items: _units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedFrom = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
<<<<<<< HEAD
=======

>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ke:", style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  value: _selectedTo,
                  items: _units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTo = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
<<<<<<< HEAD
=======

>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
<<<<<<< HEAD
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                List<String> buttons = [
                  "1", "2", "3",
                  "4", "5", "6",
                  "7", "8", "9",
                  "C", "0", "←"
                ];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: ElevatedButton(
                    onPressed: () {
                      if (buttons[index] == "C") {
                        _onReset();
                      } else if (buttons[index] == "←") {
                        _onDelete();
                      } else {
                        _onNumberPressed(buttons[index]);
                      }
                    },
                    child: Text(
                      buttons[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
=======
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                if (index == 9) {
                  return ElevatedButton(
                    onPressed: _onReset,
                    child: const Text("C", style: TextStyle(fontSize: 20, color: Colors.red)),
                  );
                } else if (index == 10) {
                  return ElevatedButton(
                    onPressed: () => _onNumberPressed("0"),
                    child: const Text("0", style: TextStyle(fontSize: 20)),
                  );
                } else if (index == 11) {
                  return ElevatedButton(
                    onPressed: _onDelete,
                    child: const Icon(Icons.backspace, color: Colors.red),
                  );
                } else {
                  return ElevatedButton(
                    onPressed: () => _onNumberPressed("${index + 1}"),
                    child: Text("${index + 1}", style: const TextStyle(fontSize: 20)),
                  );
                }
              },
            ),
            const SizedBox(height: 20),

>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
            ElevatedButton(
              onPressed: _convert,
              child: const Text("Konversi", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
<<<<<<< HEAD
=======

>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 1f483239688a4fbd0cd86301f6d1f6f4bf8b08f3
