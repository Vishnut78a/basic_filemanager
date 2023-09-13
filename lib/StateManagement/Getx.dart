
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

Future<List<Model>> forwardlist(Directory tapped)async{

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
  print(999);

  list.value=[];

  print(23423);
  var result =  await channel.invokeMethod("externalStorage");
  externaldirectory.value=result as String;
  directorylist.value=[];
  directorylist.value.add(Directory(result));

  print("directory fectcher11"+directorylist.value.toString());
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

  print(directorylist.toString()+"11");
  print(externaldirectory.toString()+"11");

  return list;

}
}