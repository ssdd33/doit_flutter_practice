import 'package:doit_flutter_practice/secondDetail.dart';
import 'package:doit_flutter_practice/subDetail.dart';
import 'package:doit_flutter_practice/thirdPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes:{
        '/':(context)=>SubDetail(),
        '/second':(context)=>SecondDetail(),
        '/third':(context)=>ThirdDetail(),
      }
    );
  }
}
