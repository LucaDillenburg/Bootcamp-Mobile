import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(width: 300, height: 20, child: Placeholder()),
        Container(width: 300, height: 80, child: Placeholder()),
      ],
    );
  }
}
