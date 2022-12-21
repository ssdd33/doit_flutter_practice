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
      title: 'Widget example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetApp(),
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  State<WidgetApp> createState() => _WidgetAppState();
}

class _WidgetAppState extends State<WidgetApp> {
  TextEditingController value1 = TextEditingController();
  TextEditingController value2 = TextEditingController();
  String _sum = '0';
  Widget? _buttonIcon;
  String? _buttonText;
  List<String> _buttonList = ['더하기', '나누기', '곱하기', '빼기'];
  List<DropdownMenuItem<String>> _dropDownMenuItems =
      List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _buttonIcon = getButtonIcon(_buttonList[0]);
    _buttonText = _buttonList[0];

    for (var item in _buttonList) {
      _dropDownMenuItems.add(DropdownMenuItem(child: Text(item), value: item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('widget example'),
        ),
        body: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('결과 : $_sum'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: value1,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: value2,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        var value1Int = double.parse(value1.value.text);
                        var value2Int = double.parse(value2.value.text);
                        var result;
                        switch (_buttonText) {
                          case '더하기':
                            result = value1Int + value2Int;
                            break;
                          case '빼기':
                            result = value1Int - value2Int;
                            break;
                          case '곱하기':
                            result = value1Int * value2Int;
                            break;
                          case '나누기':
                            result = value1Int / value2Int;
                            break;
                        }
                        _sum = '$result';
                      });
                    },
                    child: Row(
                      children: [_buttonIcon!, Text(_buttonText!)],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: DropdownButton(
                    items: _dropDownMenuItems,
                    onChanged: (String? value) {
                      setState(() {
                        _buttonText = value!;
                        _buttonIcon = getButtonIcon(value);
                      });
                    },
                    value: _buttonText,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget getButtonIcon(String value) {
    switch (value) {
      case '더하기':
        return Icon(Icons.add);
      case '곱하기':
        return Icon(Icons.close);
      case '나누기':
        return Icon(Icons.percent);
      case '빼기':
        return Icon(Icons.remove);
      default:
        return Icon(Icons.add);
    }
  }
}
