



import 'package:flutter/material.dart';

import 'add_customer.dart';
import 'home_view_body_forms.dart';
import 'home_view_header.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AddCustomer(),
          ),
          SliverToBoxAdapter(child: HomeViewHeader()),
          SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              )),
          HomeViewBodyForms(),
        ],
      ),
    );
  }
}

