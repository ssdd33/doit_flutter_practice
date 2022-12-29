import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class LargeFileMain extends StatefulWidget {
  @override
  State<LargeFileMain> createState() => _LargeFileMainState();
}

class _LargeFileMainState extends State<LargeFileMain> {
  final imgUrl =
      'https://images.pexels.com/photos/240040/pexels-photo-240040.jpeg'
      '?auto=compress';
  bool downloading = false;
  var progressString = "";
  String file = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Large file example'),
        ),
        body: Center(
          child: downloading ? Container(
              height: 120.0,
              width: 200.0,
              child: Card(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Downloading File : $progressString',
                        style: TextStyle(color: Colors.white,
                        ))
                  ],
                ),
              )
          ):FutureBuilder(
            //FutureBuilder : 비동기로 데이터를 받아서 처리한 후 만들어지는 위젯
            builder:(context,snapshot){
              //snapshot : FutureBuiler.future에서 받아온 데이터를 저장한 dynamic 형태의 변수
              switch(snapshot.connectionState){

                case ConnectionState.none : //FutureBuilder.future가 null일때
                  print('none');
                return Text('데이터 없음');
                case ConnectionState.waiting : //연결되기 전 (FutureBuilder.future에서 데이터를 반환받지 않았을 때)
                  print('waiting');
                return CircularProgressIndicator();
                case ConnectionState.active: //하나 이상의 데이터를 반환받을 때
                  print('active');
                  return CircularProgressIndicator();
                case ConnectionState.done: // 모든 데이터를 받아서 연결이 끝날 때
                  print('done');
                  if(snapshot.hasData){
                    return snapshot.data as Widget; // snapshot.data : downloadWidget(file)함수가 반환하는 데이터
                  }
              }
              print('end progress');
              return Text('데이터 없음');
            },
            future: downloadWidget(file),
          ),

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          downloadFile();
        },
        child:Icon(Icons.file_download),
      ),
    );
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();
    try {
      var dir =
      await getApplicationDocumentsDirectory(); //path_provider패키지가 제공하며 플러터 앱의 내부 디렉터리를 가져온다.
      // imgUrl에서 내려받음 파일을 내부 디렉터리 안에 myimage.jpg라는 이름으로 저장
      await dio.download(imgUrl, '${dir.path}/myimage.jpg',
          onReceiveProgress: (rec, total) {
            //진행 상황을 표시한다. rec : 지금까지 내려받은 데이터의 크기, total: 전체 파일의 크기
            print('Rec: $rec , Total: $total');
            file = '${dir.path}/myimage.jpg';
            setState(() {
              downloading = true;
              progressString = ((rec / total) * 100).toStringAsFixed(0) + '%';
            });
          });
    } catch (e) {
      print(e);
    }
    setState(() {
      downloading = false;
      progressString = 'Completed';
    });
    print('Download completed');
  }

  Future<Widget> downloadWidget(String filePath) async {
    File file  = File(filePath);
    bool exist = await file.exists();

    new FileImage(file).evict(); // 캐시 초기화, 플러터는 캐시에 같은 이름의 이미지가 있으면 이미지를 변경하지 않고 해당 이미지를 사용한다.

    if(exist){

      return Center(
        child:Column(children: [Image.file(File(filePath))],)
      );
    }else{
      return Text('No data');
    }
  }
}
