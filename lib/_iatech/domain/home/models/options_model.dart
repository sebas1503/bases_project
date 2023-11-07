import 'package:flutter/material.dart';

class OptionsModel {
  final String title;
  final String image;
  final VoidCallback onPressed;

  OptionsModel(this.title, this.image, this.onPressed);
}
