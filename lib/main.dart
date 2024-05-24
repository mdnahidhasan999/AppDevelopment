import 'package:flutter/material.dart';
import 'product_list_screen.dart';
void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: ProductListScreen()
    );

  }
}
