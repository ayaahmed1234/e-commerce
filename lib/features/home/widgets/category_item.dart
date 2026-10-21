import 'package:flutter/material.dart';
class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.bgColor, required this.color});
final String title;
final Color bgColor;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,

        borderRadius: BorderRadiusGeometry.all(
          Radius.circular(30),
        ),
      ),
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
            color: color,
          ),
        ),
      ),
    );
  }
}
