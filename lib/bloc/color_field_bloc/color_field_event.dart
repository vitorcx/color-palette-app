import 'package:flutter/material.dart';

abstract class ColorFieldEvent {
  const ColorFieldEvent();
}

class ColorChanged extends ColorFieldEvent {
  final String color;

  const ColorChanged({required this.color});
}
