

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../StateManagement/Getx.dart';

class FileLists extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FileListsState();
  }

}

class FileListsState extends State<FileLists>{
  var channel = MethodChannel("storage");
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(height: 10,color:CupertinoColors.black);
  }

  directoryfetcher(){
    var result = channel.invokeMethod("externalStorage");
    controller.externaldirectory.value=result as String;
    print(controller.externaldirectory);
  }

}