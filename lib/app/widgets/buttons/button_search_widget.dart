import 'package:flutter/material.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';

class ButtonSearchWidget extends StatelessWidget {
  const ButtonSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.COLOR_WHITE,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            "Buscar personaje...",
            style: TEXT_THEME_WHITE.bodyText2,
          )
        ],
      ),
    );
  }
}
