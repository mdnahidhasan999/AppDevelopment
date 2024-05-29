import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practiceapp/add_product.dart';
import 'package:practiceapp/update_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool _getProductListInProgress = false;
  List<Product> productList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
      ),
      body: Visibility(
        visible: _getProductListInProgress == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.separated(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return _buildProductItem(productList[1]);
          },
          separatorBuilder: (_, __) => const Divider(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _getProductList() async {
    _getProductListInProgress = true;
    setState(() {});
    productList.clear();
    const String getProductListUrl =
        'https://crud.teamrabbil.com/api/v1/ReadProduct';
    Uri uri = Uri.parse(getProductListUrl);

    Response response = await get(uri);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);

      final jsonproductList = decodedData['date'];

      for (Map<String, dynamic> p in jsonproductList) {
        Product product = Product(
          id: p['_id'] ?? '',
          productName: p['ProductName'] ?? '',
          productCode: p['ProductCode'] ?? '',
          image: p['Img'] ?? '',
          unitPrice: p['UnitPrice'] ?? '',
          quantity: p['QTY'] ?? '',
          totalPrice: p['TotalPrice'] ?? '',
        );
        productList.add(product);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(' Get Product List Failed!')));
    }
    _getProductListInProgress = false;
    setState(() {

    });
  }

  Widget _buildProductItem(Product product) {
    return ListTile(
      leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile_picture.jpg')),
      title:  Text(product.productName),
      subtitle:  Wrap(
        spacing: 16,
        children: [
          Text('Unit Price: ${product.unitPrice}'),
          Text('Quantity : ${product.quantity}'),
          Text('Total Price: ${product.totalPrice}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const UpdateProductScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_sharp),
            onPressed: () {
              _showDeleteConfirmationDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content:
          const Text('Are you sure that you want to delete this product?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Yes, delete'),
            ),
          ],
        );
      },
    );
  }
}

class Product {
  // 'id' : "",
  // 'ProductName' : "",
  // 'ProductCode' : "",
  // 'Img' : "",
  // 'UnitPrice' : "210",
  // 'Qty' : "",
  // 'TotalPrice' : "",
  // 'CreatedDate' : "",
  final String id;
  final String productName;
  final String productCode;
  final String image;
  final String unitPrice;
  final String quantity;
  final String totalPrice;

  Product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.image,
    required this.unitPrice,
    required this.quantity,
    required this.totalPrice,
  });
}
