


import 'package:account_mangment_responsive/core/utils/global_variable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';

class SearchedListViewCustomerItem extends StatelessWidget {
  const SearchedListViewCustomerItem({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 0,
      child: ListTile(
        title: Text(
          searchedForCharacters[index].customerName!,
          style: AppStyles.styleMedium20(context),
        ),
        leading: Text(
          textAlign: TextAlign.start,
          '${index + 1} -',
          style: AppStyles.styleMedium20(context),
        ),
        subtitle: Text(searchedForCharacters[index].phone!),
        trailing: Text(
          '${searchedForCharacters[index].money!}',
          style: AppStyles.styleMedium20(context).copyWith(color: defaultColor),
        ),
      ),
    );
  }
}
