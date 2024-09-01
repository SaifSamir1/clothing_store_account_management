import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/methods.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import '../../../../home_view/data/models/customer_model.dart';
import '../../../data/models/product_model.dart';
import '../../manger/add_product-and_deduction_cubit/add_product_and_deduction_cubit.dart';
import '../../manger/add_product-and_deduction_cubit/add_product_and_deduction_state.dart';

class DeductionButtonBlocConsumer extends StatefulWidget {
  const DeductionButtonBlocConsumer({
    super.key,
    required this.deductionController,
    required this.byWhoController,
    required this.formKey,
    required this.allDetailsForTheCustomerModel,
  });

  final TextEditingController deductionController;
  final TextEditingController byWhoController;
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  final GlobalKey<FormState> formKey;

  @override
  State<DeductionButtonBlocConsumer> createState() =>
      _DeductionButtonBlocConsumerState();
}

class _DeductionButtonBlocConsumerState
    extends State<DeductionButtonBlocConsumer> {
  int sumAndDeduction = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductAndDeductionCubit,
        AddProductAndDeductionState>(
      listener: (context, state) {
        if (state is ChangeCustomerMoneyError) {
          showFlutterToastError(S.of(context).Pleasetryagain);
          log(state.errorMessage);
        }
        if (state is ChangeCustomerMoneySuccess) {
          showFlutterToastSuccess(S.of(context).deductionsuccessfully);
        }
        if (state is AddProductSuccess) {
          updateTheMoney(context);
        }
      },
      builder: (context, state) {
        return CustomButton(
          textStyle: AppStyles.styleMedium16(context).copyWith(
            color: Colors.white
          ),
          color: defaultColor,
          text: S.of(context).Deduction,
          onPressed: () {
            sumAndDeduction =
                sumAndDeduction + int.parse(widget.deductionController.text);
            deductionTheMoney(context);
          },
          minWidth: 80,
          isLoading:
              state is AddProductLoading || state is ChangeCustomerMoneyLoading,
        );
      },
    );
  }

  void updateTheMoney(BuildContext context) {
    CustomerModel newMoney = CustomerModel(
        customerName: widget.allDetailsForTheCustomerModel
            .allDetailsForTheCustomerModel.customerDetails.customerName,
        phone: widget.allDetailsForTheCustomerModel
            .allDetailsForTheCustomerModel.customerDetails.phone,
        dateTime: widget.allDetailsForTheCustomerModel
            .allDetailsForTheCustomerModel.customerDetails.dateTime,
        money: sumAndDeduction > widget.allDetailsForTheCustomerModel.newMoney
            ? 0
            : widget.allDetailsForTheCustomerModel.newMoney - sumAndDeduction);
    BlocProvider.of<AddProductAndDeductionCubit>(context)
        .changeCustomerMoney(
      newData: newMoney,
      customerId: widget.allDetailsForTheCustomerModel
          .allDetailsForTheCustomerModel.customerId,
    )
        .then((value) {
      widget.deductionController.clear();
      widget.byWhoController.clear();
    });
  }

  void deductionTheMoney(BuildContext context) {
    AddProductAndDeductionModel productModel = AddProductAndDeductionModel(
        dateTime: DateTime.now(),
        money: widget.deductionController.text,
        productNameOrByWho: '${S.of(context).paidBy} ${widget.byWhoController.text}',
        paidOrProduct: 'paid');
    BlocProvider.of<AddProductAndDeductionCubit>(context)
        .addProductAndDeduction(
      addProductAndDeductionModel: productModel,
      customerId: widget.allDetailsForTheCustomerModel
          .allDetailsForTheCustomerModel.customerId,
    );
  }
}
