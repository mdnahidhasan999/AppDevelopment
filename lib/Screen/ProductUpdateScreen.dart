import 'package:flutter/material.dart';

import '../RestAPI/RestClient.dart';
import '../Style/style.dart';
import 'ProductGridViewScreen.dart';

class Productupdatescreen extends StatefulWidget {
  final Map productItem;

  const Productupdatescreen(this.productItem);

  @override
  State<Productupdatescreen> createState() => _ProductupdatescreenState();
}

class _ProductupdatescreenState extends State<Productupdatescreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };
  bool Loading = false;

  @override
  void initState() {
    setState(() {
      FormValues.update("Img", (value) => widget.productItem['Img']);
      FormValues.update(
          "ProductCode", (value) => widget.productItem['ProductCode']);
      FormValues.update(
          "ProductName", (value) => widget.productItem['ProductName']);
      FormValues.update("Qty", (value) => widget.productItem['Qty']);
      FormValues.update(
          "TotalPrice", (value) => widget.productItem['TotalPrice']);
      FormValues.update(
          "UnitPrice", (value) => widget.productItem['UnitPrice']);
    });

    super.initState();
  }

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
      setState(() {
        Loading = true;
      });
      await productUpdateRequest(FormValues, widget.productItem['_id']);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => productGridViewScreen()),
          (Route route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: (SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: FormValues['ProductName'],
                    onChanged: (Textvalue) {
                      InputOnChange("ProductName", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Name'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: FormValues['ProductCode'],
                    onChanged: (Textvalue) {
                      InputOnChange("ProductCode", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Code'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: FormValues['Img'],
                    onChanged: (Textvalue) {
                      InputOnChange("Img", Textvalue);
                    },
                    decoration: AppInputDecoration('Product Image'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: FormValues['UnitPrice'],
                    onChanged: (Textvalue) {
                      InputOnChange("UnitPrice", Textvalue);
                    },
                    decoration: AppInputDecoration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    initialValue: FormValues['TotalPrice'],
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
