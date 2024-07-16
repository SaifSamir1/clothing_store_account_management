


import 'package:account_mangment_responsive/features/auth_view/presentaion/views/widgets/country_name_body.dart';
import 'package:flutter/material.dart';

class SelectTheDayView extends StatelessWidget {
  const SelectTheDayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: SelectTheDayBody(),
      ),
    );
  }
}

