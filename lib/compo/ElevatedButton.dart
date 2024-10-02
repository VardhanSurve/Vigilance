import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.color1,
    required this.color2,
    required this.onPressed,
    required this.padh,
    required this.padv,
  }) : super(key: key);

  final String title;
  final double padh;
  final double padv;
  final Color color1;
  final Color color2;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(1, 0.4),
          colors: [color1, color2],
          tileMode: TileMode.mirror,// Your gradient colors
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff8babec),
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: padh, vertical: padv),
          elevation: 0,
          backgroundColor: Colors.transparent, // Make button transparent
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        onPressed:onPressed,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
