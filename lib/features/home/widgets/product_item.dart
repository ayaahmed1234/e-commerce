import 'package:ecommerce/core/helper/app_text_style.dart';
import 'package:flutter/material.dart';
class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.title, required this.price, required this.image});
final String title;
final num price;
final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15)
          ,borderSide: BorderSide(
          color: Colors.grey.shade200
      )
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          ClipRRect(
              borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
              child: Image.network(image )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
              overflow: TextOverflow.ellipsis,maxLines: 1,
            style: AppTextStyle.black_600_22.copyWith(fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("$price"r"$",style: AppTextStyle.primary_400_15.copyWith(fontWeight: FontWeight.w500),),
          ),
        ],
      ),
    );
  }
}
