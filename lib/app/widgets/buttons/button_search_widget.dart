import 'package:flutter/material.dart';

import 'package:rickandmorty/app/widgets/actions/build_actions_search.dart';
import 'package:rickandmorty/app/widgets/texts/text_search_field.dart';

class ButtonSearchWidget extends StatelessWidget {
  const ButtonSearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: const [
          BuildActionsSearch(),
          TextSearchField(),
        ],
      ),
    );
  }
}
