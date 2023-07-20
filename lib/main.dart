import 'package:classpass/routes/routes.dart';

import 'package:classpass/theme/color_schemes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  runApp(
      const MyHomePage());
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {

  final GoRouter router = Routes.buildRouter();

  @override
  Widget build(BuildContext context) {
   return MaterialApp.router(
     debugShowCheckedModeBanner: false,

     theme: ThemeData(
         useMaterial3: true, colorScheme: lightColorScheme,



     ),
     darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme,

       appBarTheme: AppBarTheme(
         centerTitle: true,
         titleTextStyle:TextStyle(
             fontWeight: FontWeight.bold,fontSize: 18),

       )
     ),
    // themeMode: _themeMode,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    // locale: appLocale,
    routerConfig: router,
   );
  }
}

