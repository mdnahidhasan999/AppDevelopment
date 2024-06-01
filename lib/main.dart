import 'package:flutter/material.dart';
import 'Screen/ProductCreateScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        title: 'Flutter CRUD APP',

        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.blue),
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        home: const ProductCreateScreen()

    );
  }


}



