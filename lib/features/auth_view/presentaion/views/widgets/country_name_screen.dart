



import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/shop_header.dart';
import 'package:flutter/material.dart';

import 'country_name_filed.dart';


class CountryNameScreen extends StatelessWidget {
  const CountryNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: ShopHeader(),
        ),
        Expanded(
          flex: 2,
          child: CountryNameFiled(),
        )
      ],
    );
  }
}

