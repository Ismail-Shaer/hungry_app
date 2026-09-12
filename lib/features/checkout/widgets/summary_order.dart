import 'package:flutter/material.dart';

class SummaryOrder extends StatelessWidget {
  const SummaryOrder({
    super.key,
    required this.title,
    required this.value,
    this.isBold = false,
  });

  final String title;
  final String value;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    final fontWeight = isBold ? FontWeight.bold : FontWeight.normal;
    final color = isBold ? Colors.black : Colors.grey.shade600;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(fontWeight: fontWeight, color: color),
        ),
        Text(
          value,
          style: TextTheme.of(
            context,
          ).bodyMedium?.copyWith(fontWeight: fontWeight),
        ),
      ],
    );
  }
}
