

import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/the_body_widget.dart';
import 'package:flutter/material.dart';


class MobileLayoutSelectTheDay extends StatelessWidget {
  const MobileLayoutSelectTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      height: double.infinity,
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          Expanded(
            flex: 4,
            child: TheBodyWidget(),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
