import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textalk/modules/home/home_ctrler.dart';
import 'package:textalk/modules/home/text_input/my_text_input.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      leading: const Icon(Icons.zoom_in_outlined),
      title: Obx(()=>Slider(value: controller.fontSize.value,
       onChanged: (v)=>controller.fontSize.value=v, 
       min:12, max:200,
       inactiveColor: Colors.yellow,
       activeColor: Colors.red,
       thumbColor: Colors.amber,
       ),),
    ),

    body: FractionallySizedBox(
      heightFactor: 1,
      child: Container(
        color: Colors.amber,
        child: const MyTextInput(), 
        ),
    ),
    );
  }
}