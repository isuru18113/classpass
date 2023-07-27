import 'dart:io';
import 'dart:typed_data';

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

  @override
  Widget build(BuildContext context) {

 //   final imagePathProvider = Provider.of<ImagePathProvider>(context);


    return Scaffold(

      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.register_selection_title),
      ),
      body: accountRegistrationWidget()

    );



  }

  Widget accountRegistrationWidget(){
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

      ],
    );
  }


  Widget userAccountImage(){
    return Consumer<ImagePathProvider>(

      builder: (BuildContext context, value, Widget? child) {

        print("paiyoo " + value.imagePath.toString());

        return  GridTile(

          child:  InkWell(

            onTap: (){

              // GoRouter.of(context).push(Routes.imageCropperPage);

              GetImageFromCamera.getImageFromCamera(context).whenComplete(() {

              });

            },
            customBorder: const CircleBorder(),
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(
              radius: 100,
              child:  value.imagePath!=null? Image.memory(value.imagePath as Uint8List)
                  :Icon(Icons.image_rounded,size: 50,),

            ),
          ),



        );
      },

    );
  }

  Widget firstName(){

    return  const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 8),
        child: TextField(


          decoration: InputDecoration(
              border: InputBorder.none,
              //hintText: 'Enter text here',
              labelText: "First Name"
          ),
        ),
      ),
    );
  }

  Widget lastName(){

    return  const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0,horizontal: 8),
        child: TextField(


          decoration: InputDecoration(
            border: InputBorder.none,
            //hintText: 'Enter text here',
            labelText: "Last Name"
          ),
        ),
      ),
    );
  }

  Widget addressName(){

    return  TextField(

      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'First Name',
      ),
    );
  }
}

