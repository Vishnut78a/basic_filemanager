
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Model/Model.dart';

class Controller extends GetxController{
  var channel = MethodChannel("storage");
RxString externaldirectory=" ".obs;
RxList<Model> list = <Model>[].obs;
RxList<Model> tempfiles = <Model>[].obs;
RxList<Directory> directorylist= <Directory>[].obs;

forwardlist(Directory tapped){
  directorylist.value.add(tapped);
  list.value=[];
  List<FileSystemEntity> l = tapped.listSync();
  for(FileSystemEntity i in l){
    if(i is Directory){
      list.add(Model(directory: i.path));
    }
    else{
      tempfiles.add(Model(file:i.path));
    }
  }
   list.value.addAll(tempfiles.value);
   tempfiles.value=[];

  return list.value;
}

Future<List<Model>> directoryfetcher()async{
  list.value=[];
  var result =  await channel.invokeMethod("externalStorage");
  externaldirectory.value=result as String;
  directorylist.value.add(Directory(result));

  List<FileSystemEntity> l = Directory(result).listSync();
  for(FileSystemEntity i in l){
    if(i is Directory){
      list.add(Model(directory: i.path));
    }
    else{
      tempfiles.add(Model(file:i.path));
    }
  }
  list.value.addAll(tempfiles.value);
  tempfiles.value=[];

  print(directorylist[0]);
  print(externaldirectory);

  return list;

}
}