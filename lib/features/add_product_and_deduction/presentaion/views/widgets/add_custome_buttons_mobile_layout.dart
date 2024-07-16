import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import 'add_button_bloc_consumer.dart';

class AddProductButtonsMobileLayout extends StatelessWidget {
  const AddProductButtonsMobileLayout(
      {super.key,
      required this.nameController,
      required this.priceController,
      required this.formKey,
      required this.allDetailsForTheCustomerModel});

  final TextEditingController nameController;
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;
  final TextEditingController priceController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          text: 'Cancel',
          onPressed: () {
            GoRouter.of(context).pop();
          },
          minWidth: 80,
          color: Colors.blueGrey,
        ),
        const SizedBox(
          width: 20,
        ),
        AddButtonBlocConsumer(
          formKey: formKey,
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
          priceController: priceController,
          nameController: nameController,
        ),
      ],
    );
  }
}
