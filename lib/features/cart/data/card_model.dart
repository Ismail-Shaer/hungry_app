import 'package:hungry_app/core/constants/app_images.dart';

class CardModel {
  final String image;
  final String title;
  final String desc;
  int quantity;

  CardModel({
    required this.image,
    required this.title,
    required this.desc,
    this.quantity = 1,
  });
}

List<CardModel> items = [
  CardModel(image: AppImages.burger1, title: "Humburger", desc: "Humburger"),
  CardModel(image: AppImages.burger2, title: "Humburger", desc: "Humburger"),
  CardModel(image: AppImages.burger3, title: "Humburger", desc: "Humburger"),
  CardModel(image: AppImages.burger4, title: "Humburger", desc: "Humburger"),
  CardModel(image: AppImages.burger1, title: "Humburger", desc: "Humburger"),
];
