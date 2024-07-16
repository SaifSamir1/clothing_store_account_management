import 'dart:developer';

import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/methods.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import '../../../data/models/product_model.dart';
import '../../manger/add_product-and_deduction_cubit/add_product_and_deduction_cubit.dart';
import '../../manger/add_product-and_deduction_cubit/add_product_and_deduction_state.dart';

class AddButtonBlocConsumer extends StatefulWidget {
  const AddButtonBlocConsumer({
    super.key,
    required this.priceController,
    required this.nameController,
    required this.allDetailsForTheCustomerModel, required this.formKey,
  });
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  final TextEditingController priceController;
  final TextEditingController nameController;
  final GlobalKey<FormState> formKey;

  @override
  State<AddButtonBlocConsumer> createState() => _AddButtonBlocConsumerState();
}

class _AddButtonBlocConsumerState extends State<AddButtonBlocConsumer> {
  int sumAndDeduction = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductAndDeductionCubit,
        AddProductAndDeductionState>(
      listener: (context, state) {
        if (state is ChangeCustomerMoneyError) {
          showFlutterToastError('Please try again');
          log(state.errorMessage);
        }
        if (state is ChangeCustomerMoneySuccess) {
          showFlutterToastSuccess('Product added successfully');
        }
        if (state is AddProductSuccess)
          {
            updateTheMoney(context);
          }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Add',
          onPressed: () {
                sumAndDeduction = sumAndDeduction + int.parse(widget.priceController.text);
                addProduct(context);
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
        customerName: widget.allDetailsForTheCustomerModel.allDetailsForTheCustomerModel.customerDetails.customerName,
        phone: widget.allDetailsForTheCustomerModel.allDetailsForTheCustomerModel.customerDetails.phone,
        dateTime: widget.allDetailsForTheCustomerModel.allDetailsForTheCustomerModel.customerDetails.dateTime,
        money : widget.allDetailsForTheCustomerModel.newMoney +  sumAndDeduction
    );
    BlocProvider.of<AddProductAndDeductionCubit>(context).changeCustomerMoney(
      newData: newMoney,
      customerId: widget.allDetailsForTheCustomerModel.allDetailsForTheCustomerModel.customerId,
    ).then((value) {
      widget.nameController.clear();
      widget.priceController.clear();
    });
  }

  void addProduct(BuildContext context) {
    AddProductAndDeductionModel productModel = AddProductAndDeductionModel(
      dateTime: DateTime.now(),
      money: widget.priceController.text,
      productNameOrByWho: widget.nameController.text,
      paidOrProduct: 'product'
    );
    BlocProvider.of<AddProductAndDeductionCubit>(context)
        .addProductAndDeduction(
      addProductAndDeductionModel: productModel,
      customerId: widget.allDetailsForTheCustomerModel.allDetailsForTheCustomerModel.customerId,
    );
  }
}
