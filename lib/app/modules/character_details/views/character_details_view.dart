import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/character_details_controller.dart';

class CharacterDetailsView extends GetView<CharacterDetailsController> {
  const CharacterDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CharacterDetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CharacterDetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
