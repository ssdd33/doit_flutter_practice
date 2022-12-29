import 'package:flutter/material.dart';

class SecondDetail extends StatelessWidget {
  const SecondDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Second Page'),),
      body:Container(
        child:Center(
          child: ElevatedButton(
            onPressed:(){
              Navigator.of(context).pop();
            },
            child: Text('돌아가기'),
          ),
        ),
      )
    );
  }
}