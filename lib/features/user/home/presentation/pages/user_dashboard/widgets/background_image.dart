import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/user_back.png",
      fit: BoxFit.cover,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      alignment: Alignment.topCenter,
    );
  }
}
