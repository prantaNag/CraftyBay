import 'package:flutter/material.dart';

class CenteredCircularPrograssIndicator extends StatelessWidget {
  const CenteredCircularPrograssIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}