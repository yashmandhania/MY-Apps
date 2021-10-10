import 'package:flutter/material.dart';
import 'package:worldtime_app/widgets/home.dart';
import 'package:worldtime_app/widgets/choose_location.dart';
import 'package:worldtime_app/widgets/loading.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (contect) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
