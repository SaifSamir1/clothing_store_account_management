import 'package:flutter/material.dart';

import 'add_customer.dart';
import 'home_grid_view.dart';
import 'home_view_header.dart';

class DesktopLayoutHomeView extends StatelessWidget {
  const DesktopLayoutHomeView({super.key});

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
            height: 15,
          )),
          HomeGridView()
        ],
      ),
    );
  }
}


