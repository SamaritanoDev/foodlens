import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
        final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final styleTitle = textTheme.titleMedium?.copyWith(
      color: colorScheme.primary,
    );
    return Row(
      children: [
        Image.asset('assets/icon-75.png'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FoodLens', style: styleTitle),
            Text('Personaliza tu receta:', style: styleTitle),
          ],
        ),
      ],
    );
  }
}
