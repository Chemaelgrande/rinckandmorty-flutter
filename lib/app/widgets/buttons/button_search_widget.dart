import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/build_actions_search.dart';
import 'package:rickandmorty/app/widgets/text_search_field.dart';

class ButtonSearchWidget extends StatelessWidget {
  const ButtonSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          BuildActionsSearch(),
          TextSearchField(),
        ],
      ),
    );
  }
}
