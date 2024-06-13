import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practiceapp/Screen/ProductCreateScreen.dart';

import '../RestAPI/RestClient.dart';
import '../Style/style.dart';
import 'ProductUpdateScreen.dart';

class productGridViewScreen extends StatefulWidget {
  const productGridViewScreen({super.key});

  @override
  State<productGridViewScreen> createState() => _productGridViewScreenState();
}

class _productGridViewScreenState extends State<productGridViewScreen> {
  var productList = [];
  bool Loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    var data = await productGridViewListRequest();

    setState(() {
      productList = data;
      Loading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text("Delete !"),
              content: const Text("Once Delete, You can't get it Back"),
              actions: [
                OutlinedButton(
                    onPressed: () async {
                      Navigator.pop(context);

                      await ProductDeleteRequest(id);
                      await callData();
                    },
                    child: const Text("Yes")),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No")),
              ]);
        });
  }

  GotoUpdate(context, productItem){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (builder) =>  Productupdatescreen(productItem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Product'),
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: Loading
                ? (const Center(child: CircularProgressIndicator()))
                : RefreshIndicator(
                    onRefresh: () async {
                      await callData();
                    },
                    child: GridView.builder(
                        gridDelegate: ProductGridViewStyle(),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    productList[index]['Img'],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(productList[index]['ProductName']),
                                        const SizedBox(
                                          height: 7,
                                        ),
                                        Text(
                                            "${"Price: " + productList[index]['UnitPrice']} BDT"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {
                                                GotoUpdate(context,productList[index]);
                                              },
                                              child: const Icon(
                                                  CupertinoIcons
                                                      .ellipsis_vertical_circle,
                                                  size: 18,
                                                  color: colorGreen),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            OutlinedButton(
                                              onPressed: () {
                                                DeleteItem(
                                                  productList[index]['_id'],
                                                );
                                              },
                                              child: const Icon(
                                                  CupertinoIcons.delete,
                                                  size: 18,
                                                  color: colorRed),
                                            ),
                                          ],
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          );
                        })),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (builder) => const ProductCreateScreen()));
          },
          child: const Icon(Icons.add)),
    );
  }
}

