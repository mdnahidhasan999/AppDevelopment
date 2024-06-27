import 'package:flutter/material.dart';
import 'package:practiceapp/Style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Sum App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, double> FormValue = {
    'Num1': 0,
    'Num2': 0,
    'Num3': 0,
  };
  double Sum=0;

  @override
  Widget build(BuildContext context) {
    MyInputOnChange(InputKey, InputValue) {
      setState(() {
        FormValue.update(InputKey, (value) => double.parse(InputValue));
      });
    }
    AddAllNumber(){
      setState((){
        Sum=FormValue['Num1']!+FormValue['Num2']!+FormValue['Num3']!;
      });

    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(Sum.toString(), style: HeadTextStyle()),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) {
                MyInputOnChange('Num1', value);
              },
              decoration: AppInputStyle('First Number'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) {
                MyInputOnChange('Num2', value);
              },
              decoration: AppInputStyle('Second Number'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) {
                MyInputOnChange('Num3', value);
              },
              decoration: AppInputStyle('Third Number'),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: AppButtonStyle(),
                child: const Text('Add'),
                onPressed: () {
                  AddAllNumber();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
