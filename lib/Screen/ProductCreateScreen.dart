import 'package:flutter/material.dart';

import '../Style/style.dart';

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
          ScreenBackground(context),
          Container(
            child: (SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (value) {},
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                      value: "",
                      items: const [
                        DropdownMenuItem(
                          value: '',
                          child: Text('Select Qt'),
                        ),
                        DropdownMenuItem(
                          value: '1 pcs',
                          child: Text('1 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '2 pcs',
                          child: Text('2 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '3 pcs',
                          child: Text('3 pcs'),
                        ),
                        DropdownMenuItem(
                          value: '4 pcs',
                          child: Text('4 pcs'),
                        ),
                      ],
                      onChanged: (value) {},
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {},
                        child: SuccessButtonChild('Submit')),
                  )
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
