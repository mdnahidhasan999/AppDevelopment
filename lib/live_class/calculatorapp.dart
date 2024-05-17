import 'package:flutter/material.dart';

//import 'live_class/calculatorapp.dart';
// appBarTheme: const AppBarTheme(
// backgroundColor: Colors.amber, foregroundColor: Colors.white),
// inputDecorationTheme: const InputDecorationTheme(
// border: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.blue)),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.blue)),
// enabledBorder: OutlineInputBorder(),
// contentPadding: EdgeInsets.all(16),
// )
//calculator
// home: const HomeScreen()




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numOneTECController = TextEditingController();
  final TextEditingController _numTwoTECController = TextEditingController();
  double _result = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numOneTECController,
              decoration: const InputDecoration(
                  hintText: 'Number 1', labelText: 'Number 1'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              controller: _numTwoTECController,
              decoration: const InputDecoration(
                  hintText: 'Number 2', labelText: 'Number 2'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: _add,
                  icon: const Icon(Icons.add),
                  label: const Text('add'),
                ),
                //sizeBox(height:12.0),
                ElevatedButton.icon(
                  onPressed: _sub,
                  icon: const Icon(Icons.remove),
                  label: const Text('Sub'),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Text(style: const TextStyle(fontSize: 30), 'Result:   $_result')
          ],
        ),
      ),
    );
  }

  void _add() {
    double numberOne = double.tryParse(_numOneTECController.text) ?? 0;
    double numberTwo = double.tryParse(_numTwoTECController.text) ?? 0;

    _result = numberOne + numberTwo;
    setState(() {});
  }

  void _sub() {
    double numberOne = double.tryParse(_numOneTECController.text) ?? 0;
    double numberTwo = double.tryParse(_numTwoTECController.text) ?? 0;

    _result = numberOne - numberTwo;
    setState(() {});
  }

  @override
  void dispose() {
    _numOneTECController.dispose();
    _numTwoTECController.dispose();
    super.dispose();
  }
}
