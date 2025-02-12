import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({super.key, required this.title, required this.icon,this.onPressed});
  final String title;
  final IconData icon;
  Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title,style: TextStyle(fontSize: 22),),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16)
          ),
          child: IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
          ),
        ),
      ],
    );
  }
}
