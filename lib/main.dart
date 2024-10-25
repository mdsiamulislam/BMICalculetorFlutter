import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController1 = TextEditingController();
  TextEditingController editingController2 = TextEditingController();

  double height = 0, weight = 0, age = 0 , bmi=0;
  String status = "Not calculate yead";

  calculate() {
    setState(() {
      height = double.tryParse(editingController1.text) ?? 0.0;
      weight = double.tryParse(editingController2.text) ?? 0.0;

      height = height / 100; // Convert height from cm to meters

      bmi = weight / (height * height);

      // Corrected the conditional statements for BMI classification
      if (bmi < 18.5) {
        status = "Underweight";
      } else if (bmi >= 18.5 && bmi < 24.9) {
        status = "Normal weight";
      } else if (bmi >= 25 && bmi < 30) {
        status = "Overweight";
      } else {
        status = "Obesity";
      }
    });

    editingController1.clear();
    editingController2.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Find Your BMI"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column
            children: [
              const Text(
                "Area Calculator",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16), // Add padding to the card
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space the items evenly
                        children: [
                          const Text("Height:\n (cm)"),
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 16, 0)),
                          Expanded( // Ensure the text field uses available space
                            child: TextField(
                              controller: editingController1,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Enter Height",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16), // Add space between rows
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Weight:\n (kg)"),
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 16, 0)),
                          Expanded(
                            child: TextField(
                              controller: editingController2,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Enter Weight",
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20), // Space before button
                      ElevatedButton(
                        onPressed: calculate,
                        child: const Text("Submit"),
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(0, 32, 0, 0)),
                      Text("BMI : ${bmi}"),
                      Text("Status : ${status}"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}

