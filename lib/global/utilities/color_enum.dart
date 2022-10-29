import 'package:flutter/material.dart';

enum ColorEnum {
  all(Colors.white, 'All'),
  blue(Color(0xFF64B5F6), 'Blue'),
  pink(Color(0xFFF06292), 'Pink'),
  yellow(Color(0xFFFFB74D), 'Yellow'),
  red(Color(0xFFE57373), 'Red'),
  purple(Color(0xFFBA68C8), 'Purple'),
  green(Color(0xFF81C784), 'Green'),
  defaut(Color.fromARGB(255, 229, 188, 236), 'defaut');

  const ColorEnum(this.color, this.name);

  final Color color;
  final String name;

  @override
  String toString() {
    return name;
  }

  static ColorEnum from(String value) {
    if (value == 'blue') return blue;
    if (value == 'pink') return pink;
    if (value == 'yellow') return yellow;
    if (value == 'red') return red;
    if (value == 'purple') return purple;
    if (value == 'green') return green;
    if (value == 'defaut') return defaut;

    throw Exception('cor $value nao implementada');
  }

  static List<ColorEnum> get avaliableColors =>
      [blue, pink, yellow, red, purple, green];
}
