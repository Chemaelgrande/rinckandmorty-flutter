import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/character_controller.dart';

class CharacterView extends GetView<CharacterController> {
  const CharacterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CharacterView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CharacterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
