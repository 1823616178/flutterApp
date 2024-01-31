import 'dart:ui';

/// HEX转Color
Color hexToColor(String hexString) {
  final color = int.parse(hexString.replaceFirst('#', ''), radix: 16);
  return Color(color);
}
