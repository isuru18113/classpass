import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import 'package:provider/provider.dart';

import '../../routes/routes.dart';
import '../../services/get_camera_image.dart';
import '../../utils/image_path_provider.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({Key? key}) : super(key: key);

  @override
  _AdminRegisterPageState createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  // String? imagePathProvider = ImagePathProvider().imagePath;
  ImagePathProvider imagePathProvider = ImagePathProvider();

  @override
  void dispose() {
    super.dispose();

    imagePathProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //   final imagePathProvider = Provider.of<ImagePathProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.register_selection_title),
        ),
        body: accountRegistrationWidget());
  }

  Widget accountRegistrationWidget() {
    return ListView(

      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: userAccountImage(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: firstName(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: lastName(),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align
            (alignment: Alignment.centerRight,
              child: createAccount()),
        )
      ],
    );
  }

  Widget userAccountImage() {
    return Consumer<ImagePathProvider>(
      builder: (context, imagePathProvider, _) {
        return Center(
            child: InkWell(
          onTap: () {
            GetImageFromCamera.getImageFromCamera(context);
          },
          customBorder: const CircleBorder(),
          borderRadius: BorderRadius.circular(100),
          child: CircleAvatar(
            radius: 100,




            child: imagePathProvider.stringValue != null? Image.memory(
                imagePathProvider.stringValue!.bytes
            ):const Icon(Icons.image_rounded),


          ),
        ));
      },
    );
  }

  Widget firstName() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              //hintText: 'Enter text here',
              labelText: "First Name"),
        ),
      ),
    );
  }

  Widget lastName() {
    return const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              //hintText: 'Enter text here',
              labelText: "Last Name"),
        ),
      ),
    );
  }

  Widget addressName() {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'First Name',
      ),
    );
  }

  ///Create Button
  Widget createAccount() {
    return FilledButton(
        onPressed: () {

        },
        child: Text(AppLocalizations.of(context)!.button_next));
  }
}
