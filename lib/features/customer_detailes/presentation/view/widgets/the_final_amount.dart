import 'dart:developer';

import 'package:account_mangment_responsive/core/utils/app_router.dart';
import 'package:account_mangment_responsive/core/widgets/refresh_icon.dart';
import 'package:account_mangment_responsive/features/customer_detailes/presentation/manger/customer_details_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';

class TheFinalAmount extends StatefulWidget {
  const TheFinalAmount({
    super.key,
    required this.allDetailsForTheCustomerModel,
  });

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<TheFinalAmount> createState() => _TheFinalAmountState();
}

class _TheFinalAmountState extends State<TheFinalAmount> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerDetailsCubit>(context).getCustomerInfo(
        customerId: widget.allDetailsForTheCustomerModel.customerId);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('   -${S.of(context).FinalAccount}:  ',
            style: AppStyles.styleSemiBold24WithoutFontFamily(context)),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.black12,
                width: 2,
              ),
            ),
          ),
          child: BlocBuilder<CustomerDetailsCubit, CustomerDetailsState>(
            builder: (context, state) {
              if (state is GetCustomerInfoLoading) {
                return Center(
                  child: CircularProgressIndicator(color: defaultColor),
                );
              }
              if (state is GetCustomerInfoSuccess ||
                  state is GetCustomerDetailsSuccess) {
                log('${BlocProvider.of<CustomerDetailsCubit>(context).customerInfo.money}');
                return Text(
                  '${BlocProvider.of<CustomerDetailsCubit>(context).customerInfo.money}',
                  style: AppStyles.styleMedium20(context)
                      .copyWith(color: defaultColor),
                );
              }
              return const Text('        ');
            },
          ),
        ),
        const Spacer(),
        RefreshIcon(onPressed: () {
          GoRouter.of(context).pushReplacement(AppRouter.kCustomerDetailsView,
              extra: widget.allDetailsForTheCustomerModel);
        }),
      ],
    );
  }
}
