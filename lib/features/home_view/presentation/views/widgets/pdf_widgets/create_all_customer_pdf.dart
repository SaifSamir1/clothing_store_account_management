import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/pdf_cubit/pdf_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/pdf_service.dart';
import '../../../../../../core/utils/storage_permission.dart';
import 'build_pdf_all_customer_header.dart';
import 'build_pdf_all_customers_footer.dart';
import 'build_pdf_customers_details_table.dart';

class CreateAllCustomerPdf extends StatefulWidget {
  const CreateAllCustomerPdf({
    super.key,
  });

  @override
  State<CreateAllCustomerPdf> createState() => _CreateAllCustomerPdfState();
}

class _CreateAllCustomerPdfState extends State<CreateAllCustomerPdf> {
  List<dynamic> customersLastPaidDate = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PdfCubit, PdfState>(
      listener: (context, state) {
        if (state is GetLastDateForCustomerPaidSuccess) {
          customersLastPaidDate = state.getLastDateForCustomerPaid;
        }
      },
      child: ListTile(
        title: Text(S.of(context).transformToPDF),
        leading: const Icon(Icons.picture_as_pdf),
        onTap: () async {
          BlocProvider.of<PdfCubit>(context).getCustomerLastPaidDate(
            allCustomers:
                BlocProvider.of<HomeCubit>(context).allCustomersDetails.docs,
          );
          if (!await requestStoragePermission(context)) {
            return; // Permission not granted
          }
          final pdfFile = await PdfService.generate(
            pagesContent: [
              buildAllCustomerHeader(),
              // ignore: use_build_context_synchronously
              buildCustomerDetailsTable(
                  lastPaidDate: customersLastPaidDate, context: context),
            ],
            footerContent: buildFooter(),
          );
          PdfApi.openFile(pdfFile);
        },
      ),
    );
  }
}
