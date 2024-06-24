import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lottie/LottieLego.json',
              width: 200, height: 200, fit: BoxFit.scaleDown),
          const Text("Todo List Empty", style: TextStyle(
            fontSize: 11,
            color: Colors.grey
          ))
        ],
      ),
    );
  }
}
