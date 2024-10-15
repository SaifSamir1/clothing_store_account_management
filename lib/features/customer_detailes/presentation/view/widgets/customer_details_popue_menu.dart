
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theme/app_style.dart';
import '../../../../../core/utils/pdf_service.dart';
import '../../../../../core/utils/storage_permission.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/all_details_for_the_customer_model.dart';
import 'customer_pdf/build_pdf_customer_details_table.dart';
import 'customer_pdf/build_pdf_customer_footer.dart';
import 'customer_pdf/build_pdf_customer_header.dart';

class CustomerDetailsPopupMenu extends StatelessWidget {
  const CustomerDetailsPopupMenu({super.key, required this.allDetailsForTheCustomerModel});
  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      position: PopupMenuPosition.under,
      onSelected: (String result) async {
        switch (result) {
          case 'edit':
            GoRouter.of(context).push(Routes.editCustomer,
                extra: allDetailsForTheCustomerModel);
            break;
          case 'create_pdf':
            await _handleCreatePDF(context);
            break;
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'edit',
          child: Text(
            S.of(context).edit,
            style: AppStyles.styleMedium20(context),
          ),
        ),
        PopupMenuItem<String>(
          value: 'create_pdf',
          child: Text(
            S.of(context).transformToPDF,
            style: AppStyles.styleMedium20(context),
          ),
        ),
      ],
    );
  }
  Future<void> _handleCreatePDF(context) async {
    if (!await requestStoragePermission(context)) {
      return;
    }
    final pdfFile = await PdfService.generate(
      context: context,
      pagesContent: [
        buildCustomerHeader(context),
        buildCustomerDetailTable(
          context: context,
        ),
      ],
      footerContent: buildCustomerFooter(),
    );

    await PdfApi.openFile(pdfFile);
  }
}
