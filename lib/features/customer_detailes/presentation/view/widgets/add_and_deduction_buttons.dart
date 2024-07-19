import 'package:account_mangment_responsive/core/routing/routes.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import '../../../data/models/all_new_details_for_the_customer.dart';
import '../../manger/customer_details_cubit.dart';

class AddAndDeductionButtons extends StatefulWidget {
  const AddAndDeductionButtons({
    super.key,
    required this.allDetailsForTheCustomerModel,
  });

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<AddAndDeductionButtons> createState() => _AddAndDeductionButtonsState();
}

class _AddAndDeductionButtonsState extends State<AddAndDeductionButtons> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CustomerDetailsCubit>(context).getCustomerInfo(
        customerId: widget.allDetailsForTheCustomerModel.customerId);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          color: defaultColor,
            text: S.of(context).AddProduct,
            onPressed: () {
              AllNewDetailsForTheCustomerModel
                  allNewDetailsForTheCustomerModel =
                  AllNewDetailsForTheCustomerModel(
                      allDetailsForTheCustomerModel:
                          widget.allDetailsForTheCustomerModel,
                      newMoney: BlocProvider.of<CustomerDetailsCubit>(context)
                          .customerInfo
                          .money!);
              GoRouter.of(context).push(Routes.addProductView,
                  extra: allNewDetailsForTheCustomerModel);
            },
            minWidth: 100),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: FittedBox(
              child: CustomButton(
                  color: defaultColor,
                  text: S.of(context).Deduction,
                  onPressed: () {
                    AllNewDetailsForTheCustomerModel
                        allNewDetailsForTheCustomerModel =
                        AllNewDetailsForTheCustomerModel(
                            allDetailsForTheCustomerModel:
                                widget.allDetailsForTheCustomerModel,
                            newMoney:
                                BlocProvider.of<CustomerDetailsCubit>(context)
                                    .customerInfo
                                    .money!);
                    GoRouter.of(context).push(Routes.deductionView,
                        extra: allNewDetailsForTheCustomerModel);
                  },
                  minWidth: 100)),
        ),
      ],
    );
  }
}
