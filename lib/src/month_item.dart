import 'package:flutter/material.dart';

/// Creates a Widget to represent the months.
class MonthItem extends StatelessWidget {
  const MonthItem({
    Key? key,
    required this.name,
    required this.onTap,
    this.isSelected = false,
    this.color,
    this.activeColor,
    this.shrink = false,
  }) : super(key: key);
  final String name;
  final Function onTap;
  final bool isSelected;
  final Color? color;
  final Color? activeColor;
  final bool shrink;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Text(
        name,
        style: TextStyle(
          fontSize: 17,
          color: isSelected ? activeColor : const Color(0xff9A9A9A),
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w300,
        ),
      ),
    );
  }
}
