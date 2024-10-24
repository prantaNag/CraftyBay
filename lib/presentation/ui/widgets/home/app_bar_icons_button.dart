import 'package:flutter/material.dart';

class AppbarIcons extends StatelessWidget {
  const AppbarIcons({
    super.key, required this.onTap, required this.iconData,
  });

  final VoidCallback onTap;
  final IconData iconData;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.blueGrey,
        child: Icon(
          size: 18,
          iconData,
        
        color: Colors.greenAccent,),
      ),
    );
  }
}