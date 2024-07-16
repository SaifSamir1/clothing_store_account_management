




import 'package:flutter/material.dart';

import 'list_item.dart';

class HomeGridView extends StatelessWidget {
  const HomeGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 30,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 6
      ), itemBuilder: (BuildContext context, int index) {
      return  GestureDetector(
          onTap: ()
          {

          },
          child: CustomerItem(
            index: index,));
    },);
  }
}

