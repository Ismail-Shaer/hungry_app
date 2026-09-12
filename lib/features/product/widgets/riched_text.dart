import 'package:flutter/material.dart';

class RichedText extends StatelessWidget {
  const RichedText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextTheme.of(context).titleSmall?.copyWith(height: 1.1),
        children: [
          TextSpan(
            text: 'Customize ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: 'Your Burger to Your Tastes. Ultimate Experience',
            style: TextTheme.of(context).bodySmall

          ),
        ],
      ),
    );
  }
}
