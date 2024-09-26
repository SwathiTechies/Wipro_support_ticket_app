import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  final ImagePicker _picker = ImagePicker();
  List<File> _image = [];
  String? _imageError;

  Future<void> _requestPermissions() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request permission
      await Permission.storage.request();
    }
  }


  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        if (_image.length < 5) {
          _image.add(File(image.path)); // Add the camera image
        } else {
          _showMessage("You can only select up to 5 images.");
        }
      });
    }
  }

  Future<void> _pickFileFromLocal() async {
    try {
      // Request permissions first
      await _requestPermissions();

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.image,
      );

      if (result != null && result.paths.isNotEmpty) {
        List<File> files = result.paths.map((path) => File(path!)).toList();

        if (files.length > 5) {
          _showMessage("You can only select up to 5 images.");
        } else {
          setState(() {
            _image.addAll(files); // Add selected files to the image list
          });
        }
      } else {
        _showMessage("No files selected.");
      }
    } catch (e) {
      _showMessage("An error occurred: $e");
      print(e); // Print the error to console for debugging
    }
  }



  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.camera),
              title: Text('Camera'),
              onTap: () {
                Navigator.pop(context);
                _openCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Files'),
              onTap: () {
                Navigator.pop(context);
                _pickFileFromLocal();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        child: Column(
          children: [
            _image.isEmpty
                ? Text('No image captured.')
                : Container(
              height: 100,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Only 1 row needed for horizontal scrolling
                ),
                itemCount: _image.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    height: 100,
                    width: 100, // Width for the images
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.file(
                      _image[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            if (_imageError != null)
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.01),
                child: Text(
                  _imageError!,
                  style: TextStyle(color: Colors.red, fontSize: screenHeight * 0.02),
                ),
              ),
            SizedBox(
              height: screenHeight * 0.01,
            ),

            Center(
              child: ElevatedButton(
                onPressed: _image.length == 5 ? null : _showOptions,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff415A8C),
                ),
                child: Text(
                  'UPLOAD PICTURE',
                  style: TextStyle(color: Colors.white, fontSize: screenHeight * 0.018),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
