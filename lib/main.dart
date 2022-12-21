import 'package:doit_flutter_practice/sub/firstPage.dart';
import 'package:doit_flutter_practice/sub/secondPage.dart';
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    /*
    * length: 몇 개의 탭을 만들지 지정
    * vsync: 탭이 이동했을 때 호출되는 콜백 함수를 어디서 처리할지 지정
    * state클래스에 with 키워드로 SingleTickerProviderStateMixin클래스를 지정하면 vsync : this 오류가 해결됨
    * 클래스를 추가 상속함으로써 탭을 눌렀을 때 state클래스에서 애니메이션 동작을 처리할 수 있게 함*/
  }

  @override
  void dispose() {
    /*
    * 스테이트풀이 마지막에 호출하는 함수
    * 탭 컨트롤러는 애니메이션을 이용하므로 dispose()함수를 호출해 주어야 메모리 누수를 막을 수 있다.*/
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar example'),
      ),
      body: TabBarView(
        controller: controller,
        children: [FirstApp(), SecondApp()],
      ),
      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            text: '목록',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.blue,
            ),
            text: '추가하기',
          ),
        ],
      ),
    );
  }
}
