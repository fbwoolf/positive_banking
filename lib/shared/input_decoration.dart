import 'package:flutter/material.dart';

const inputDecoration = InputDecoration(
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  fillColor: Colors.white,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.green,
      width: 2.0,
    ),
  ),
);
