

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
                             Obx(()=>

                                  ListView.builder( scrollDirection: Axis.horizontal,
                                                   itemCount: controller.directorylist.length,
                                                   itemBuilder: ( context, index)=>

                                           TextButton(onPressed: (){},
                                                         child:
                                                           Text(index==0?"Internal Storage "
                                                                               :"${controller.directorylist[index]} >"),
                                           ),
                                          ),
                                        ),



                          );
  }
}