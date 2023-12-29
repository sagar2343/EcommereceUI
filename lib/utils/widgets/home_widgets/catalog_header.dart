import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../themes.dart';


class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Tysale".text.xl5.bold.color(context.theme.focusColor).make(),
        "Trending products".text.color(Colors.grey).xl2.make(),
      ],
    );
  }
}
