import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../../services/get_camera_image.dart';

class RegisterAccountPage extends StatefulWidget {
  const RegisterAccountPage({Key? key}) : super(key: key);

  @override
  _RegisterAccountPageState createState() => _RegisterAccountPageState();
}

class _RegisterAccountPageState extends State<RegisterAccountPage> {
  @override
  Widget build(BuildContext context) {
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

  Widget accountImage(String imagePath){
    return  ListTile(
      leading: CircleAvatar(
        radius: 100,
        child: Image.file(File(imagePath)),
      ),
      title: Expanded(child: Text("Account Image"))
    );
  }

  Widget userAccountImage(){
    return GridTile(
      child:  InkWell(
        onTap: (){

         // GoRouter.of(context).push(Routes.imageCropperPage);

          GetImageFromCamera.getImageFromCamera(context);

        },
        customBorder: const CircleBorder(),
        borderRadius: BorderRadius.circular(100),
        child: CircleAvatar(
          radius: 100,
          child: Icon(Icons.image_rounded,size: 50,),

        ),
      ),



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

