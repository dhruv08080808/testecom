import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String? selectedImage;

  void updateImage(int option) {
    setState(() {
      switch (option) {
        case 1:
          selectedImage = 'lib/assets/e1.webp';
          break;
        case 2:
          selectedImage = 'lib/assets/e2.webp';
          break;
        case 3:
          selectedImage = 'lib/assets/e3.webp';
          break;
        default:
          selectedImage = null;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (selectedImage != null)
              Image.asset(
                selectedImage!,
                width: 200,
                height: 200,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updateImage(1);
              },
              child: Text('Press 1 for Auto'),
            ),
            ElevatedButton(
              onPressed: () {
                updateImage(2);
              },
              child: Text('Press 2 for Car'),
            ),
            ElevatedButton(
              onPressed: () {
                updateImage(3);
              },
              child: Text('Press 3 for Bike'),
            ),
          ],
        ),
      ),
    );
  }
}
