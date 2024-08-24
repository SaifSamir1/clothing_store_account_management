import 'package:account_mangment_responsive/features/add_product_and_deduction/data/repositry/add_product_and_deduction_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import '../../manger/add_product-and_deduction_cubit/add_product_and_deduction_cubit.dart';
import 'dedction_text_form_fileds.dart';
import 'deduction_buttons_mobile_layout.dart';

class DeductionDetails extends StatefulWidget {
  const DeductionDetails({
    super.key,
    required this.allDetailsForTheCustomerModel,
  });

  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<DeductionDetails> createState() =>
      _DeductionDetailsState();
}

class _DeductionDetailsState
    extends State<DeductionDetails> {
  TextEditingController byWhoController = TextEditingController();
  TextEditingController deductionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
    deductionController.dispose();
    byWhoController.dispose();
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
            DeductionTextFormField(
              formKey: formKey,
              byWhoController: byWhoController,
              deductionController: deductionController,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocProvider(
              create: (context) =>
                  AddProductAndDeductionCubit(AddProductAndDeductionRepoImpl()),
              child: DeductionButtons(
                formKey: formKey,
                allDetailsForTheCustomerModel:
                    widget.allDetailsForTheCustomerModel,
                deductionController: deductionController,
                byWhoController: byWhoController,
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
