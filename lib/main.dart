import 'package:flutter/material.dart';
import 'package:locationapp/providers/places.dart';
import 'package:locationapp/routes/app_routes.dart';
import 'package:locationapp/screens/home_page.dart';
import 'package:locationapp/screens/place_form.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Places(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location App',
        theme: ThemeData(
          primarySwatch: Colors.brown,
          accentColor: Colors.amberAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => PlaceForm(),
        },
      ),
    );
  }
}
