import 'package:account_mangment_responsive/features/add_product_and_deduction/data/repositry/add_product_and_deduction_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import '../../manger/add_product-and_deduction_cubit/add_product_and_deduction_cubit.dart';
import 'add_custome_buttons_mobile_layout.dart';
import 'add_product_text_form_field.dart';

class MobileLayoutProductDetails extends StatefulWidget {
  const MobileLayoutProductDetails(
      {super.key, required this.allDetailsForTheCustomerModel});
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<MobileLayoutProductDetails> createState() =>
      _MobileLayoutProductDetailsState();
}

class _MobileLayoutProductDetailsState
    extends State<MobileLayoutProductDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, top: 15.0, bottom: 25, right: 25.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: buildShapeDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            AddProductTextFormField(
              nameController: nameController,
              priceController: priceController,
              formKey: formKey,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocProvider(
              create: (context) =>
                  AddProductAndDeductionCubit(AddProductAndDeductionRepoImpl()),
              child: AddProductButtonsMobileLayout(
                allDetailsForTheCustomerModel:
                    widget.allDetailsForTheCustomerModel,
                nameController: nameController,
                priceController: priceController,
                formKey: formKey,
              ),
            ),
          ],
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
