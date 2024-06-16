import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/screen/pet-owner/pet/pet-registraton-form.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  final XFile image;

  const DisplayPictureScreen(
      {super.key, required this.imagePath, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pet Picturer')),
      body: Image.file(File(imagePath)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return PetRegistrationForm(
                image: this.image,
              );
            },
          ));
        },
        backgroundColor: DoctorColor.primary,
        child: Icon(
          Icons.keyboard_arrow_right,
          color: DoctorColor.white,
          size: 50,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
