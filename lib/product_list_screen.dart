import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(backgroundImage: AssetImage('assets/images/profile_picture.jpg')),
              title: const Text('Product Name'),
              subtitle: const Wrap(
                spacing: 16,
                children: [
                  Text('Unit Price: 100'),
                  Text('Quantity: 100'),
                  Text('Unit Price: 100'),
                ],
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_sharp),
                    onPressed: () {},
                  ),
                ],
              ),
            );
          }),
    );
  }
}
