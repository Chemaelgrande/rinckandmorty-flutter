import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';

class ListFavouriteButton extends StatelessWidget {
  const ListFavouriteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return Obx(
      () => GestureDetector(
        onTap: () async {
          characterController.listIsFavorite.value =
              !characterController.listIsFavorite.value;
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.COLOR_LIGHT_GREY,
            shape: BoxShape.circle,
          ),
          height: 36,
          width: 36,
          child: Icon(
            Icons.star,
            size: 20,
            color: (characterController.listIsFavorite.value == true)
                ? Colors.yellow
                : Colors.white,
          ),
        ),
      ),
    );
  }
}
