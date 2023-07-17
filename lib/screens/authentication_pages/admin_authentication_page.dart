import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_alert_dialog.dart';
import '../../widgets/phone_authentication.dart';


class AdminAuthenticationPage extends StatefulWidget {
  const AdminAuthenticationPage({Key? key}) : super(key: key);

  @override
  _AdminAuthenticationPageState createState() => _AdminAuthenticationPageState();
}

class _AdminAuthenticationPageState extends State<AdminAuthenticationPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Sign in"),
      ),
      body: adminAuthListView()
    );
  }

  Widget adminAuthListView(){

    return ListView(

      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: phoneNumberInputWidget(context, _phoneNumberController),
        ),

        Padding(

          padding: const EdgeInsets.all(8.0),
          child: Text("Once you press nexct you will recveie a sms to your mobile number",
            style: Theme.of(context).textTheme.bodyMedium,),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: FilledButton(onPressed: (){


              verifyNumberLength();
            }, child: Text("Next")),
          ),
        )
      ],
    );


  }
  void verifyNumberLength(){

    if(_phoneNumberController.text.isNotEmpty
        && _phoneNumberController.text.length == 10){

      print("ok");
    }else{
      customDialg(title: 'hutto',content: "sdd",context: context).showAlertDialog();
      print("not okay");
    }

}

}
