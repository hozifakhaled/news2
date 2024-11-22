import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


part 'ArticalesModel.g.dart';
@HiveType(typeId: 0)
class ArticalesModel extends HiveObject{
  @HiveField(0)
   String title;
  @HiveField(1)
   String image;
  @HiveField(2)
   String url;

  ArticalesModel(
      {required this.title,
      required this.image,
      required this.url,
      });
}