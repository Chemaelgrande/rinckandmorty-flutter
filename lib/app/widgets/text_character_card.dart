import 'package:flutter/material.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';

class TextCharacterCard extends StatelessWidget {
  final String title;
  final String subtitle;
  const TextCharacterCard({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TEXT_THEME_BLACK.subtitle2,
              text: title,
            ),
          ),
          RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TEXT_THEME_BLACK.bodyText1,
              text: subtitle,
            ),
          ),
        ],
      ),
    );
  }
}
