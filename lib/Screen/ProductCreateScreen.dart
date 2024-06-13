import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/style.dart';
import 'ProductGridViewScreen.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };

  InputOnChange(Mapkey, Textvalue) {
    setState(() {
      FormValues.update(Mapkey, (value) => Textvalue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['Img']!.isEmpty) {
      ErrorToast('Image Required !');
    } else if (FormValues['ProductCode']!.isEmpty) {
      ErrorToast('Product Code Required !');
    } else if (FormValues['ProductName']!.isEmpty) {
      ErrorToast('Product Name Required !');
    } else if (FormValues['Qty']!.isEmpty) {
      ErrorToast('Product Qty Required !');
    } else if (FormValues['TotalPrice']!.isEmpty) {
      ErrorToast('Product Total Price Required !');
    } else if (FormValues['UnitPrice']!.isEmpty) {
      ErrorToast('Product Unit Price Required !');
    } else {
      await productCreateRequest(FormValues);Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const productGridViewScreen()),
              (Route route) => false);
    }
  }

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
                    onChanged: (Textvalue) {
                      InputOnChange("ProductName", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (Textvalue) {
                      InputOnChange("ProductCode", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (Textvalue) {
                      InputOnChange("Img", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (Textvalue) {
                      InputOnChange("UnitPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    onChanged: (Textvalue) {
                      InputOnChange("TotalPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Total Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppDropDownStyle(
                    DropdownButton(
                      value: FormValues['Qty'],
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
                      onChanged: (Textvalue) {
                        InputOnChange("Qty", Textvalue);
                      },
                      underline: Container(),
                      isExpanded: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                        style: AppButtonStyle(),
                        onPressed: () {
                          FormOnSubmit();
                        },
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
