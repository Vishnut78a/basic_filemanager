



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Lists/PrimaryList.dart';

class PrimaryPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PrimaryPageState();
  }

}
class PrimaryPageState extends State<PrimaryPage>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permissionHandler();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(appBar: AppBar(title: Text("SAMPLE VERSION")),
                      body: Container(child:FileLists()));
  }

  void permissionHandler()async{
    var permission =Permission.manageExternalStorage.status;
    if(await permission.isDenied){
      Permission.manageExternalStorage.request();
      print(Permission.storage.status);
    }
    else{
      print(111);
    }
}

}