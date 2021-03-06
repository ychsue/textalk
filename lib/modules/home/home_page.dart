import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textalk/modules/home/for_chromecast/for_chromecast.dart';
import 'package:textalk/modules/home/home_ctrler.dart';
import 'package:textalk/modules/home/text_input/my_text_input.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
    appBar: AppBar(
      leading: const Icon(Icons.zoom_in_outlined),
      actions: const [Padding(
        padding: EdgeInsets.all(8.0),
        child: ForChromecast()),],
      title: Slider(value: controller.fontSize.value,
       onChanged: (v)=>controller.fontSize.value=v, 
       min:12, max:200,
       inactiveColor: Colors.yellow,
       activeColor: Colors.red,
       thumbColor: Colors.amber,
       ),),
    

    body: Column(
      children: [
        // For Chromecast IF it is available
        (controller.hasSession.value==true)?
          ListTile(leading: const Icon(Icons.expand), title: 
            Slider(value: controller.chromeTimes.value,
               min: 1,
               max: 8,
               onChanged: (v){
                  controller.chromeTimes.value =v;
                },),):
          const SizedBox(),
        // Main Text Input Region
        Expanded(
          child: Container(
            color: Colors.amber,
            child: const MyTextInput(), 
            ),
        ),
      ],
    ),
    ),);
  }
}