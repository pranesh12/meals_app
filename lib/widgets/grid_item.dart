import 'package:flutter/material.dart';
import 'package:khabar/models/category.dart';
import 'package:khabar/widgets/category_item.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryItem(id: category.id, title: category.title)));
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.5),
            category.color.withOpacity(1)
          ]),
        ),
        child: Text(
          category.title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
    );
  }
}
