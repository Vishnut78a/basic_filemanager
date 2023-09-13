

import 'dart:io';

import 'package:basicversion/Lists/Secondartlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Model/Model.dart';
import '../StateManagement/Getx.dart';

class FileLists extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FileListsState();
  }

}

class FileListsState extends State<FileLists>{

  Controller controller = Get.put(Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
   print(controller.directorylist.value.toString()+'dff34234');
    return Container(height: MediaQuery.of(context).size.height/1.11,
                      color: CupertinoColors.systemBlue,
                      child: FutureBuilder<List<Model>>(  future:controller.directoryfetcher() ,
                                                  builder: (context,snapshot )
                                               {
                                                 if(snapshot.hasData){
                                                 return
                                                ListView.builder(itemCount  :snapshot.data?.length,
                                                                 itemBuilder: (BuildContext context, int index){
                                                               if(snapshot.data![index].directory!= null){
                                                                 return
                                                                 ListTile(title:Text(snapshot.data![index].directory!),
                                                                           onTap: (){print("Before adding (PL)"+controller.directorylist.toString());
                                                                   controller.directorylist.value.add(Directory(snapshot.data![index].directory!));
                                                                                   print("After adding(PL)"+controller.directorylist.toString());
                                                                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecondaryFileList()));
                                                                           },);}
                                                               else{
                                                                 return ListTile(title: Text(snapshot.data![index].file!),);}}
                                                              );
                                               }

                                                else if(snapshot.connectionState==ConnectionState.waiting){
                                                  return Center(child: Text("d"));
                                                 }
                                                else{return Center(child: Text("f"));}})
    );
  }



}