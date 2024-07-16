import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';

class CustomerItem extends StatelessWidget {
  const CustomerItem({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black12,
      elevation: 0,
      child: ListTile(
        title: Text(
          BlocProvider.of<HomeCubit>(context)
              .allCustomersDetails
              .allCustomer[index]
              .customerName!,
          style: AppStyles.styleMedium20(context),
        ),
        leading: Text(
          textAlign: TextAlign.start,
          '${index + 1} -',
          style: AppStyles.styleMedium20(context),
        ),
        subtitle: Text(BlocProvider.of<HomeCubit>(context)
            .allCustomersDetails
            .allCustomer[index]
            .phone!),
        trailing: Text(
          '${BlocProvider.of<HomeCubit>(context).allCustomersDetails.allCustomer[index].money!}',
          style: AppStyles.styleMedium20(context).copyWith(color: defaultColor),
        ),
      ),
    );
  }
}
