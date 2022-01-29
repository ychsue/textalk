import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textalk/modules/home/home_ctrler.dart';

class MyTextInput extends StatefulWidget {
  const MyTextInput({Key? key}) : super(key: key);

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  final _txtCtrler = TextEditingController();
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => TextField(
          expands: true,
              controller: _txtCtrler,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                isDense: false,
                contentPadding: EdgeInsets.all(8),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: controller.fontSize.value),
            ),),
        Positioned(
          top: 8,
          right: 8,
          child: IconButton(
            onPressed: () => _txtCtrler.clear(),
            icon: const Icon(Icons.clear),
          ),
        ),
      ],
    );
  }
}
