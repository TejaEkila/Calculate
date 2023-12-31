import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttonText;
  final buttonTapped;
  final resetbutton;

  MyButton(
      {this.color,
      this.textcolor,
      required this.buttonText,
      this.buttonTapped,
      this.resetbutton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      
      child: Padding(
        
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textcolor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
