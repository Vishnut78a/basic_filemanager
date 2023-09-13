


import 'dart:io';

import 'package:basicversion/Lists/scrollview.dart';
import 'package:basicversion/MainPage/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Model/Model.dart';
import '../StateManagement/Getx.dart';

class SecondaryFileList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondaryFileListState();
  }
  
}
class SecondaryFileListState extends State<SecondaryFileList>{
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async{
                      if(controller.directorylist.length==2){print("Before removing");print(controller.directorylist.value);
                        print("After removinggg");
                        controller.directorylist.value=[];print(controller.directorylist.value);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PrimaryPage()));
                      }
                      else{print("Before removing");print(controller.directorylist.value);print("After removing");
                      controller.directorylist.removeAt(controller.directorylist.length-1);print(controller.directorylist.value);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SecondaryFileList()));}
                      return true;
        },
      child: Scaffold(
        appBar: AppBar(title: Text("Sample Version"),),
        body: Column(
          children: [
           WidgetScroller(),
            Expanded(
              child: Container(height: MediaQuery.of(context).size.height/1.11,
                  color: CupertinoColors.systemBlue,
                  child: FutureBuilder<List<Model>>(  future:controller.forwardlist(controller.directorylist.value[controller.directorylist.length-1]) ,
                      builder: (context,snapshot )
                      {
                        if(snapshot.hasData){
                          return
                            ListView.builder(itemCount  :snapshot.data?.length,
                                itemBuilder: (BuildContext context, int index){
                                  if(snapshot.data![index].directory!= null){
                                    return
                                      ListTile(title:Text(snapshot.data![index].directory!),
                                               onTap: (){ print("Before adding");
                                        controller.directorylist.value.add(Directory(snapshot.data![index].directory!));
                                        print("After adding");
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
              ),
            ),
          ],
        ),
      ),
    );;
  }
  
}