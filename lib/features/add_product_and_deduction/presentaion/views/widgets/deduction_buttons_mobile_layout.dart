import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth_view/presentaion/views/widgets/custom_auth_button.dart';
import '../../../../customer_detailes/data/models/all_new_details_for_the_customer.dart';
import 'deduction_button_bloc_consumer.dart';

class DeductionButtonsMobileLayout extends StatelessWidget {
  const DeductionButtonsMobileLayout(
      {super.key,
      required this.formKey,
      required this.byWhoController,
      required this.deductionController,
      required this.allDetailsForTheCustomerModel});

  final TextEditingController byWhoController;
  final TextEditingController deductionController;
  final GlobalKey<FormState> formKey;
  final AllNewDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          textStyle: AppStyles.styleMedium16(context),
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
        DeductionButtonBlocConsumer(
          formKey: formKey,
          byWhoController: byWhoController,
          allDetailsForTheCustomerModel: allDetailsForTheCustomerModel,
          deductionController: deductionController,
        )
      ],
    );
  }
}
