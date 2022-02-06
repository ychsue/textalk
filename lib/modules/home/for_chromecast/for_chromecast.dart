import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:textalk/modules/home/home_ctrler.dart';

class ForChromecast extends StatelessWidget {

  const ForChromecast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final c = Get.find<HomeController>();
    return Obx(() {
      if(c.isChromcastAvailable.value == false) {
        return const SizedBox();
      } else {
        return IconButton(
          onPressed: ()=>(c.hasSession.value==false)?
            c.chromecastRepository.sendMessage("歡迎使用此App. \n Welcome to use this app."):
            c.chromecastRepository.stopSession(),
          icon: FaIcon(
            FontAwesomeIcons.chromecast,
            color: (c.hasSession.value==false)?Colors.yellow:Colors.red,
            ),
        );
      }
    }
    );
  }
}