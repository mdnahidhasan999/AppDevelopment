import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
      ),
      body: Stack(
        children: [
          Container(
            child: (SingleChildScrollView(
             padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(onChanged: (value){},)
                ],

              ),
            )),
          )

        ],
      ),
    );
  }
}
