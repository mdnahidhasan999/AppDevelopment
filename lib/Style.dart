import 'package:flutter/material.dart';

InputDecoration AppInputDecoration(label){
  return InputDecoration(
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 20),
    border: const OutlineInputBorder(),
    labelText: label
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

SizedBox SizeBox50(child){
  return SizedBox(
    height: 50,
    width: double.infinity,
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: child,

    ),
  );
}


