import 'package:account_mangment_responsive/core/utils/methods.dart';
import 'package:account_mangment_responsive/features/add_and_edit_customer/data/repositry/add_edit_customer_repo_impl.dart';
import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/manger/add_customer_cubit/add_customer_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_customer_buttons_mobil_layout.dart';
import 'add_customer_text_form_filed.dart';

class CustomerDetailsMobilLayout extends StatefulWidget {
  const CustomerDetailsMobilLayout({
    super.key,
  });

  @override
  State<CustomerDetailsMobilLayout> createState() =>
      _CustomerDetailsMobilLayoutState();
}

class _CustomerDetailsMobilLayoutState
    extends State<CustomerDetailsMobilLayout> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController theBeginMoneyController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    theBeginMoneyController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, top: 15.0, bottom: 25, right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: buildShapeDecoration(),
        child: BlocProvider(
          create: (context) => AddCustomerCubit(AddEditCustomerRepoImpl()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AddCustomerTextFormField(
                nameController: nameController,
                phoneNumberController: phoneNumberController,
                theBeginMoneyController: theBeginMoneyController,
              ),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<AddCustomerCubit, AddCustomerState>(
                listener: (context, state) {
                  if (state is AddCustomerSuccess) {
                    showFlutterToastSuccess(S.of(context).AddcustomerSuccess);
                  }
                  if (state is AddCustomerError) {
                    showFlutterToastError(state.errorMessage);
                  }
                },
                builder: (context, state) {
                  return AddCustomerButtonsMobilLayout(
                    nameController: nameController,
                    phoneNumberController: phoneNumberController,
                    theBeginMoneyController: theBeginMoneyController,
                    isLoading: state is AddCustomerLoading,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ShapeDecoration buildShapeDecoration() {
    return ShapeDecoration(
      color: Colors.white,
      shape: OutlineInputBorder(
        borderSide: const BorderSide(width: 2, color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
