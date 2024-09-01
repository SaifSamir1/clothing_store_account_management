import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as  pw;
import '../../../../../../core/utils/pdf_service.dart';
import '../../../../../../generated/l10n.dart';

pw.Widget buildCustomerDetailsTable({
  required List<dynamic> lastPaidDate,
  required context,
}) {

  List headers = [
    S.of(context).number,
    S.of(context).customername,
    S.of(context).Themoney,
    S.of(context).date,
  ];

  int index = 0;
  List<CustomerModel> customers = BlocProvider.of<HomeCubit>(context).allCustomersDetails.allCustomer;
  final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

  final data = customers.map((customer) {
    index += 1;
    bool customerIsArabic = customer.customerName!.contains(RegExp(r'[\u0600-\u06FF]'));

    return [
      index,
      pw.Text(
        customer.customerName!,
        style: pw.TextStyle(
          font: customerIsArabic ? PdfService.arFont : PdfService.enFont,
        ),
      ),
      customer.money,
      lastPaidDate[index - 1],
    ];
  }).toList();

  return pw.TableHelper.fromTextArray(
    headers: headers ,
    data: data,
    border: null,
    headerStyle: pw.TextStyle(
      fontWeight: pw.FontWeight.bold,font: isArabic ? PdfService.arFont : PdfService.enFont,),
    headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
    cellHeight: 30,
    cellAlignments: {
      0: pw.Alignment.centerLeft,
      1: pw.Alignment.centerLeft,
      2: pw.Alignment.centerLeft,
      3: pw.Alignment.centerLeft,
    },
  );
}