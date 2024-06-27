import 'package:flutter/material.dart';

InputDecoration AppInputStyle(label){
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    fillColor: Colors.lime,
    filled: true,
    border: const OutlineInputBorder(),
    labelText: label
  );
}

TextStyle HeadTextStyle(){
  return const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800
  );
}


ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(22),
    backgroundColor: Colors.green,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4))
    ),

  );
}