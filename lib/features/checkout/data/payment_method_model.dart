import 'package:hungry_app/core/constants/app_images.dart';

class PaymentMethodModel {
  final String iconPath;
  final String title;
  final String? subtitle;

  PaymentMethodModel({
    required this.iconPath,
    required this.title,
    this.subtitle,
  });
}

List<PaymentMethodModel> paymentMethods = [
  PaymentMethodModel(iconPath: AppImages.dollarIcon, title: 'Cash on Delivery'),
  PaymentMethodModel(
    iconPath: AppImages.visaImage,
    title: 'Debit card',
    subtitle: '3566 **** **** 0505',
  ),
];
