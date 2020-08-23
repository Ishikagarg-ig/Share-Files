import 'package:documents_picker/documents_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  Future<void> share() async {
//    await FlutterShare.share(
//        title: 'Example share',
//        text: 'Example share text',
//        linkUrl: 'https://flutter.dev/',
//        chooserTitle: 'Example Chooser Title'
//    );
//  }

  Future<void> shareFile() async {
    List<dynamic> docs = await DocumentsPicker.pickDocuments;
    if (docs == null || docs.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: docs[0] as String,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Share Files',style: TextStyle(fontSize: 25),),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              FlatButton(
//                child: Text('Share text and link'),
//                onPressed: share,
//              ),
              RaisedButton(
                child: Text('Select file',style: TextStyle(fontSize: 20),),
                onPressed: shareFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}