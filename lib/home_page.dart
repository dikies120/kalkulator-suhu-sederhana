import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:git_baru/temperature_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                provider.input.isEmpty ? "Masukkan suhu" : provider.input,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Dari:", style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  value: provider.selectedFrom,
                  items: provider.units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) provider.setSelectedFrom(value);
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Ke:", style: TextStyle(fontSize: 16)),
                DropdownButton<String>(
                  value: provider.selectedTo,
                  items: provider.units.map((String unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) provider.setSelectedTo(value);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final buttons = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "C", "0", "←"];
                return ElevatedButton(
                  onPressed: () {
                    String val = buttons[index];
                    if (val == "C") {
                      provider.reset();
                    } else if (val == "←") {
                      provider.deleteInput();
                    } else {
                      provider.updateInput(val);
                    }
                  },
                  child: Text(buttons[index], style: const TextStyle(fontSize: 20)),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: provider.convert,
              child: const Text("Konversi", style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            Text(
              provider.result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
