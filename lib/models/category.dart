import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color; //untuk background color

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange, //defaultnya orange
  });
}
