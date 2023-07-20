import 'dart:io';
import 'dart:math';

import 'package:custom_image_crop/custom_image_crop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/routes.dart';

class ImageCropperPage extends StatefulWidget {
  final String capturedImagePath;

  const ImageCropperPage({Key? key, required this.capturedImagePath})
      : super(key: key);

  @override
  _ImageCropperPageState createState() => _ImageCropperPageState();
}

class _ImageCropperPageState extends State<ImageCropperPage> {
  late CustomImageCropController _controllerImageCropper;

  String? imagePath;

  @override
  initState() {
    super.initState();

    _controllerImageCropper = CustomImageCropController();

    imagePath = widget.capturedImagePath;
  }

  @override
  void dispose() {
    super.dispose();

    _controllerImageCropper.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop Image"),
      ),
      body: imageCropper(imagePath!),
      bottomNavigationBar: imageCropperControllers(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final image = await _controllerImageCropper.onCropImage();
          if (image != null) {
            sendNExt();
            //  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ResultScreen(image: image)));
          }
        },
        icon: Icon(Icons.crop),
        label: Text("CROP"),
      ),
    );
  }
void sendNExt(){

  GoRouter.of(context).push(Routes.registerAccountPage);

}
  Widget imageCropper(String path) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: CustomImageCrop(
        cropController: _controllerImageCropper,
        image: FileImage(File(path)),
      ),
    );
  }

  Widget imageCropperControllers() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _controllerImageCropper.reset),
        IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: () => _controllerImageCropper
                .addTransition(CropImageData(scale: 1.33))),
        IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: () => _controllerImageCropper
                .addTransition(CropImageData(scale: 0.75))),
        IconButton(
            icon: const Icon(Icons.rotate_left),
            onPressed: () => _controllerImageCropper
                .addTransition(CropImageData(angle: -pi / 4))),
        IconButton(
            icon: const Icon(Icons.rotate_right),
            onPressed: () => _controllerImageCropper
                .addTransition(CropImageData(angle: pi / 4))),
      ],
    );
  }
}
