


import 'package:flutter/cupertino.dart';

import 'country_name_section.dart';

class CountryNameFiled extends StatelessWidget {
  const CountryNameFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      child: Row(
        children: [
          Expanded(child: SizedBox()),
          Expanded(
            flex: 2,
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 330,),
                ),
                SliverToBoxAdapter(
                  child: SelectTheDaySection(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 40,),
                ),

              ],
            ),
          ),
          Expanded(
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
