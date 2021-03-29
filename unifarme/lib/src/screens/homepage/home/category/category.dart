import 'package:flutter/material.dart';
import 'package:unifarme/src/screens/homepage/home/category/vegetable.dart';

class CategorySlider extends StatefulWidget {
  @override
  _CategorySliderState createState() => _CategorySliderState();
}

class _CategorySliderState extends State<CategorySlider> {
  List<Map<String, String>> categoryVegetables = [
    {
      'title': 'All',
      'image': 'assets/categories/vegetables/1cereal.png',
    },
    {
      'title': 'Legumes',
      'image': 'assets/categories/vegetables/2legume.png',
    },
    {
      'title': 'Cruciferous',
      'image': 'assets/categories/vegetables/3cruciferous.png',
    },
    {
      'title': 'Marrow',
      'image': 'assets/categories/vegetables/4marrow.png',
    },
    {
      'title': 'Roots',
      'image': 'assets/categories/vegetables/5roots.png',
    },
    {
      'title': 'Allium',
      'image': 'assets/categories/vegetables/6allium.png',
    }
  ];

  List<Map<String, String>> categoryFruits = [
    {
      'title': 'All',
      'image': 'assets/categories/fruits/1apple.png',
    },
    {
      'title': 'Citrus',
      'image': 'assets/categories/fruits/2citrus.png',
    },
    {
      'title': 'Stone',
      'image': 'assets/categories/fruits/3stone.png',
    },
    {
      'title': 'Mango',
      'image': 'assets/categories/fruits/4mangoban.png',
    },
    {
      'title': 'Berries',
      'image': 'assets/categories/fruits/5berries.png',
    },
    {
      'title': 'Melon',
      'image': 'assets/categories/fruits/6melon.png',
    },
    {
      'title': 'Avocado',
      'image': 'assets/categories/fruits/7avocado.png',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Vegetables",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          CategoryVegetable(categoryVegetables),
          SizedBox(
            height: 10,
          ),
          Text(
            "Fruits",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 10,
          ),
          CategoryVegetable(categoryFruits),
        ],
      ),
    );
  }
}
