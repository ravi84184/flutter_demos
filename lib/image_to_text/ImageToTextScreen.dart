import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ImageToTextAppScreen extends StatefulWidget {
  const ImageToTextAppScreen({super.key});

  @override
  ImageToTextAppScreenState createState() => ImageToTextAppScreenState();
}

class ImageToTextAppScreenState extends State<ImageToTextAppScreen> {
  File? _image;
  final picker = ImagePicker();
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image to Text'),
      ),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Column(
                children: [
                  Image.file(
                    _image!,
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        readTextFromImage();
                      },
                      child: const Text("Get Text"))
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImageFromGallery,
        tooltip: 'Select Image',
        child: const Icon(Icons.image),
      ),
    );
  }

  Future<void> readTextFromImage() async {
    final inputImage = InputImage.fromFile(_image!);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);
    String text = recognizedText.text;
    print(text);
    String extractedText = "";
    for (TextBlock block in recognizedText.blocks) {
      final Rect rect = block.boundingBox;
      final List<Point<int>> cornerPoints = block.cornerPoints;
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          extractedText += "${element.text}\n";
        }
      }
    }
    textRecognizer.close();

    // Process the extracted text as required (e.g., display in a dialog).
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Extracted Text'),
          content: ListView(
            children: [
              Text(text),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
