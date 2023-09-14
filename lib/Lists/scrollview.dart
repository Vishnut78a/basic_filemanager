

import 'package:basicversion/Lists/Secondartlist.dart';
import 'package:basicversion/MainPage/mainpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../StateManagement/Getx.dart';

class WidgetScroller extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WidgetScrollerState();
  }
  
}

class WidgetScrollerState extends State<WidgetScroller>{
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {print(controller.directorylist.value.toString()+'df');
    // TODO: implement build
    return   Container(color:Colors.orange,height:MediaQuery.of(context).size.height/21,
                          child:
                             Row(
                               children: [
                                 Expanded(
                                   child: Obx(()=>

                                        ListView.builder( scrollDirection: Axis.horizontal,
                                                         itemCount: controller.directorylist.length,
                                                         itemBuilder: ( context, index)=>

                                                 TextButton(onPressed: (){
                                                   if(index==controller.directorylist.length-1)
                                                   {
                                                   }
                                                   else if(index==0){
                                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                                                                                       =>PrimaryPage()));
                                                   }
                                                   else{
                                                     controller.directorylist.removeRange(index+1,controller.directorylist.length);
                                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
                                                                                              =>SecondaryFileList()));
                                                     print(2);
                                                   }

                                                 },
                                                               child:
                                                                 Text(index==0?"Internal Storage >"
                                                                                     :"${controller.directorylist[index]} >"),
                                                 ),
                                                ),
                                              ),
                                 ),
                                 Icon(Icons.grid_view_sharp),
                                 Icon(Icons.more_vert),
                               ],
                             ),



                          );
  }
}