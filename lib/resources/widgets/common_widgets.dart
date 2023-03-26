import 'package:flutter/material.dart';

Widget customButtom({String? buttonName, onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.blue),
      child: Center(
        child: Text(
          buttonName!,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}
