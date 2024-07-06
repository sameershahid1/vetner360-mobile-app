import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vetner360/globalclass/color.dart';
import 'package:vetner360/globalclass/fontstyle.dart';
import 'package:vetner360/screen/pet-owner/pet/display.dart';
import 'package:vetner360/theme/themecontroller.dart';
import 'package:get/get.dart';

final List<String> flashDropDownItems = ["Auto", "ON", "OF"];
final Map<String, IconData> flashIconList = {
  "Auto": Icons.flash_auto,
  "ON": Icons.flash_on,
  "OF": Icons.flash_off
};

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });
  final CameraDescription camera;
  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  bool isFlashLight = false;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  String _flashValue = flashDropDownItems.first;
  IconData? _flashIcon = flashIconList["Auto"];
  final themedata = Get.put(DoctorThemecontroler());

  double height = 0.00;
  double width = 0.00;
  dynamic size;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
    _controller.setFlashMode(FlashMode.auto);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> flashModSet(String? value) async {
    if (value == "ON") {
      await _controller.setFlashMode(FlashMode.torch);
    } else if (value == "OF") {
      await _controller.setFlashMode(FlashMode.off);
    } else if (value == "Auto") {
      await _controller.setFlashMode(FlashMode.auto);
    }
  }

  Future<void> takePicture() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();

      if (!context.mounted) return;

      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: image.path,
            image: image,
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  Future pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DisplayPictureScreen(
            imagePath: pickedImage.path,
            image: pickedImage,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor:
              themedata.isdark ? DoctorColor.black : DoctorColor.white,
          leadingWidth: width / 1,
          leading: Container(
              padding: EdgeInsets.symmetric(horizontal: width / 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => {Navigator.pop(context)},
                      icon: Icon(Icons.arrow_back)),
                  Text('Take a pet picture',
                      style: isemibold.copyWith(
                          fontSize: 15,
                          color: themedata.isdark
                              ? DoctorColor.white
                              : DoctorColor.black)),
                  DropdownButton(
                      value: _flashValue,
                      elevation: 24,
                      icon: Icon(_flashIcon),
                      borderRadius: BorderRadius.circular(10),
                      onChanged: (String? value) {
                        flashModSet(value);
                        setState(() {
                          _flashIcon = flashIconList[value];
                          _flashValue = value!;
                        });
                      },
                      items: flashDropDownItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList()),
                ],
              ))),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
