import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<String> todoList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();

    todoList.add('플러터 공부');
    todoList.add('독서, 독서메모');
    todoList.add('생각으로 부터 벗어나기');
    todoList.add('출근하기');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sub Detail Example'),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          return Card(
            child: InkWell(
              child: Text(todoList[index], style: TextStyle(fontSize: 30),),
              onTap: (){
                Navigator.of(context).pushNamed('/third',arguments: todoList[index]);
                /*
                * arguments를 통해 이동하려는 페이지로 데이터를 전달할 수 있다.
                * 이동한 페이지에서 ModalRoute.of(context)!.settings.arguments.toString()형태로 argument값을 불러올 수 있다.
                */
              },
            ),
          );
        },
        itemCount:todoList.length,),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}
