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

  final cHint = "在此輸入文字，\n Input text here".obs;
  String _hintTxt() {
    final now = DateTime.now();
    String result = cHint.value;
    if((now.month==12 && now.day >= 25) || (now.month==1) ||(now.month==2 && now.day <= 5)) {
      result = "恭賀新禧\n"+result;
    }
    return result;
  }

  @override
  void initState() {
    super.initState();
    cHint.value = _hintTxt();
  }

  @override
  void dispose() {
    _txtCtrler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => TextField(
              expands: true, 
              onChanged: (v)=>controller.textValue.value =v,
              controller: _txtCtrler,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                isDense: false,
                hintText: cHint.value,
                contentPadding: const EdgeInsets.all(8),
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
