import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: confirmButton(),
    );
  }

  Widget titleWidget(){
    return Center(child: Text("ClassPass"));
  }
  
  Widget confirmButton(){
    return Center(
      child: TextButton(onPressed: (){
        context.go(Routes.adminAuthenticationPage);
      }, child: Text("next")),
    );
  }
}
