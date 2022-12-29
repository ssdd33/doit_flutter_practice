import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Sub Detail Example'),
      ),
      body:Container(
        child: Center(
          child: ElevatedButton(
            onPressed:(){
              Navigator.of(context).pushReplacementNamed('/second');
              //pushReplacementNamed : 스택 메모리에 있는 자료를 교체하여 페이지 이동
            },
            child:Text('두번째 페이지로 이동하기')
          ),
        ),
      )
    );
  }
}
