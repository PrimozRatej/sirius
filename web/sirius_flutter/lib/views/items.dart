import 'package:flutter/material.dart';
import 'package:sirius_flutter/widgets/ItemsSearchBar.dart';
import 'package:sirius_flutter/widgets/ListItemItems.dart';

class ItemsComponnet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final children = <ListItemItem>[];
    for (var i = 0; i < 10; i++) {
      children.add(ListItemItem());
    }
    return ListView(
      children: [
        ItemsSearchBar(),
        Column(children: children),
      ],
    );
  }
}
