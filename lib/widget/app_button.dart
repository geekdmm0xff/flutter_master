import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Color background;
  final Color border;
  final double size;
  final String? text;
  final IconData? icon;

  const AppButton(
      {Key? key,
      required this.color,
      required this.background,
      required this.border,
      required this.size,
      this.text,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(color: border),
          borderRadius: BorderRadius.circular(15),
          color: background),
      child: _buildChild(),
    );
  }

  Widget? _buildChild() {
    final text = this.text;
    final icon = this.icon;
    if (text == null && icon == null) {
      return null;
    }
    if (text != null) {
      return Center(
          child: Text(
        text,
        style: TextStyle(color: color),
      ));
    }
    if (icon != null) {
      return Center(child: Icon(icon));
    }
    return null;
  }
}
