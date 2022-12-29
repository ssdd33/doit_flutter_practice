import 'package:flutter/material.dart';
import 'package:doit_flutter_practice/animalItem.dart';

class SecondApp extends StatefulWidget {
  List<Animal>? list;

  SecondApp({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondApp> createState() => _SecondAppState();
}

class _SecondAppState extends State<SecondApp> {
  final nameController = TextEditingController();

  List<String> animalKind = ['포유류', '곤충', '양서류', '영장류', '파충류'];
  List<Widget> radioFieldItems = List.empty(growable: true);
  int? _radioValue = 0;
  bool? flyExist = false;
  String? _imagePath;

  // build함수 밖에서 선언된 widget은 state변화를 구독하지 못함
  // @override
  // void initState() {
  //   super.initState();
  //   radioFieldItems = animalKind.asMap().entries.map((entry) {
  //     var index = entry.key;
  //     var value = entry.value;
  //
  //     return Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Radio(
  //               value: index, groupValue: _radioValue, onChanged: _radioChange),
  //           Text(value)
  //         ]);
  //   }).toList();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              maxLines: 1,
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.orange)),
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: animalKind.asMap().entries.map((entry) {
                  var index = entry.key;
                  var value = entry.value;

                  return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Radio(
                            value: index, groupValue: _radioValue, onChanged: _radioChange),
                        Text(value)
                      ]);
                }).toList(),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist,
                  onChanged: (bool? check) {
                    setState(() {
                      flyExist = check;
                    });
                  },
                )
              ],
            ),
            Container(
                height: 100,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: widget.list!.map((animal) {
                      return GestureDetector(
                          child: Image.asset(animal.imagePath!, width: 80),
                          onTap: () {
                            setState(() {
                              _imagePath = animal.imagePath;
                            });
                          });
                    }).toList())),
            ElevatedButton(
                onPressed: () {
                  var animal = Animal(
                    animalName: nameController.value.text,
                    kind: getKind(_radioValue),
                    imagePath: _imagePath,
                    flyExist: flyExist,
                  );
                  AlertDialog dialog = AlertDialog(
                    title: Text('동물 추가하기'),
                    content: Text('이 동물은 ${nameController.value.text}입니다'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.list!.add(animal);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('추가하기'))
                    ],
                  );
                  showDialog(context: context, builder: (context) => dialog);
                },
                child: Text('동물 추가하기'))
          ],
        ),
      ),
    ));
  }

  _radioChange(int? value) {
    print(value);
    setState(() {
      _radioValue = value;
    });
  }

  getKind(int? value) {
    return animalKind[value!];
  }
}
