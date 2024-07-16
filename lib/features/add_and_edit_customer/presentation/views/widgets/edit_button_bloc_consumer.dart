import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/methods.dart';
import '../../../../../core/widgets/custom_alert_dialoge.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../../customer_detailes/data/models/all_details_for_the_customer_model.dart';
import '../../../../home_view/data/models/customer_model.dart';
import '../../manger/edit_customer_cubit/edit_customer_cubit.dart';

class EditButtonBlocConsumer extends StatelessWidget {
  const EditButtonBlocConsumer({
    super.key,
    required this.nameController,
    required this.allDetailsForTheCustomerModel,
    required this.moneyController,
    required this.phoneNumberController,
  });

  final TextEditingController nameController;
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  final TextEditingController moneyController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditCustomerCubit, EditCustomerState>(
      listener: (context, state) {
        if (state is EditCustomerSuccess) {
          showFlutterToastSuccess(S.of(context).Customersuccessfullyupdated);
          GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
        }
        if (state is EditCustomerError) {
          showFlutterToastError(state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: S.of(context).edit,
          onPressed: () {
            _showCustomDialog(context, state, () {
              positiveActionButton(context);
            });
          },
          minWidth: 80,
        );
      },
    );
  }

  void positiveActionButton(BuildContext context) {
    CustomerModel newCustomerModel = CustomerModel(
      customerName: nameController.text.isEmpty
          ? allDetailsForTheCustomerModel.customerDetails.customerName
          : nameController.text,
      dateTime: allDetailsForTheCustomerModel.customerDetails.dateTime,
      money: moneyController.text.isEmpty
          ? allDetailsForTheCustomerModel.customerDetails.money
          : int.parse(moneyController.text),
      phone: phoneNumberController.text.isEmpty
          ? allDetailsForTheCustomerModel.customerDetails.phone
          : phoneNumberController.text,
    );
    BlocProvider.of<EditCustomerCubit>(context).editCustomerInformation(
        customerId: allDetailsForTheCustomerModel.customerId,
        newData: newCustomerModel);
  }
}

void _showCustomDialog(BuildContext context, EditCustomerState state,
    VoidCallback onPositiveButtonPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // Use a custom AlertDialog widget
      return CustomAlertDialog(
        isLoading: state is EditCustomerLoading,
        title: '',
        content: S.of(context).ChangeCustomerInfo,
        nameOfPositiveButton: S.of(context).yes,
        nameOfNegativeButton: S.of(context).cansle,
        onPositiveButtonPressed: onPositiveButtonPressed,
        onNegativeButtonPressed: () {
          Navigator.of(context).pop(); // Close the dialog
          // Add custom logic for negative button
        },
      );
    },
  );
}
