import 'package:flutter/material.dart';

class SellPet extends StatelessWidget {
  const SellPet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        body: Container(
          child: Text("Sell-Pet"),
        ),
      ),
    );
  }
}
