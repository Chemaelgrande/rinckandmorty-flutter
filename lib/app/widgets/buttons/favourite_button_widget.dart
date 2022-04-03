import 'package:flutter/material.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';

class FavouriteButtonWidget extends StatelessWidget {
  const FavouriteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.COLOR_LIGHT_GREY,
          shape: BoxShape.circle,
        ),
        height: 36,
        width: 36,
        child: const Icon(
          Icons.star,
          size: 20,
          color: AppColors.COLOR_GREY,
        ),
      ),
    );
  }
}
