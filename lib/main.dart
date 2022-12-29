import 'package:doit_flutter_practice/animalItem.dart';
import 'package:doit_flutter_practice/sub/firstPage.dart';
import 'package:doit_flutter_practice/sub/secondPage.dart';
import 'package:flutter/material.dart';

import './cupertinoMain.dart';
void main() {
  runApp(CupertinoMain());
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
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);

    animalList.add(Animal(animalName:"벌",kind:"곤충",imagePath: "repo/images/bee.png"));
    animalList.add(Animal(animalName:"고양이",kind:"포유류",imagePath: "repo/images/cat.png"));
    animalList.add(Animal(animalName:"젖소",kind:"포유류",imagePath: "repo/images/cow.png"));
    animalList.add(Animal(animalName:"강아지",kind:"포유류",imagePath: "repo/images/dog.png"));
    animalList.add(Animal(animalName:"여우",kind:"포유류",imagePath: "repo/images/fox.png"));
    animalList.add(Animal(animalName:"돼지",kind:"포유류",imagePath: "repo/images/pig.png"));
    animalList.add(Animal(animalName:"늑대",kind:"포유류",imagePath: "repo/images/wolf.png"));
    animalList.add(Animal(animalName:"원숭이",kind:"영장류",imagePath: "repo/images/monkey.png"));
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
        children: [FirstApp(list:animalList), SecondApp(list:animalList)],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
        labelColor: Colors.black,
        tabs: <Tab>[
          Tab(
            text: '목록',
          ),
          Tab(text: '추가하기'),
        ],
      ),
    );
  }
}

/*
* DefaultTabController를 사용해서 tab 구현하기
* https://api.flutter.dev/flutter/material/DefaultTabController-class.html
* */
// class TabPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('TabBar example'),
//           ),
//           body: TabBarView(
//             children: [FirstApp(), SecondApp()],
//           ),
//           bottomNavigationBar: TabBar(
//             tabs: <Tab>[
//               Tab(
//                 icon: Icon(
//                   Icons.looks_one,
//                   color: Colors.blue,
//                 ),
//                 text: '목록',
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.looks_two,
//                   color: Colors.blue,
//                 ),
//                 text: '추가하기',
//               ),
//             ],
//           ),
//         ));
//   }
// }
