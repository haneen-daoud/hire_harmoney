// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  final String id ;
  final String title;
  final String imgUrl;
  final VoidCallback onTap;

  Category({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.onTap,
  });

   static List<Category> dummyCategories = [
    Category(id: '1', title: 'handicraft', imgUrl:'assets/images/handicraft.png', onTap:(){}),
    Category(id: '2', title: 'tool', imgUrl:'assets/images/tool-box.png', onTap:(){}),
    Category(id: '3', title: 'Learn', imgUrl:'assets/images/education.png', onTap:(){}),
    Category(id: '4', title: 'mechanic', imgUrl:'assets/images/mechanic.png', onTap:(){}),
    Category(id: '5', title: 'cooking', imgUrl:'assets/images/chef.png', onTap:(){}),
    Category(id: '6', title: 'mechanic', imgUrl:'assets/images/growth.png', onTap:(){}),



  ];
}
