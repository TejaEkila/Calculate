import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

//void main() => runApp(animatedpage());
class animatedpage extends StatefulWidget {
  const animatedpage({super.key});

  @override
  State<animatedpage> createState() => _animatedpageState();
}

class _animatedpageState extends State<animatedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network('https://lottiefiles.com/animations/calculate-W6NcKFzYe7'),
      ),
    );
  }
}