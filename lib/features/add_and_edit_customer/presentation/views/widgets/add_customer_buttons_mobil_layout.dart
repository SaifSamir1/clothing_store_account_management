import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/manger/add_customer_cubit/add_customer_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';

class AddCustomerButtonsMobilLayout extends StatelessWidget {
  const AddCustomerButtonsMobilLayout({
    super.key,
    required this.nameController,
    required this.phoneNumberController,
    required this.theBeginMoneyController,
    this.isLoading = false,
  });
  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController theBeginMoneyController;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomButton(
          text: S.of(context).cansle,
          onPressed: () {
            GoRouter.of(context).pop();
          },
          minWidth: 80,
          color: Colors.blueGrey,
        ),
        const SizedBox(
          width: 20,
        ),
        CustomButton(
          color: defaultColor,
          isLoading: isLoading,
          text: S.of(context).Add,
          onPressed: () {
            CustomerModel customer = CustomerModel(
              customerName: nameController.text,
              dateTime: DateTime.now(),
              money: int.parse(theBeginMoneyController.text),
              phone: phoneNumberController.text,
            );
            BlocProvider.of<AddCustomerCubit>(context)
                .addCustomer(customerModel: customer)
                .then((value) {
              nameController.clear();
              phoneNumberController.clear();
              theBeginMoneyController.clear();
            });
          },
          minWidth: 80,
        ),
      ],
    );
  }
}
