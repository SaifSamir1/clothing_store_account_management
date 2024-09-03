import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../../../../../core/utils/pdf_service.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../add_product_and_deduction/data/models/product_model.dart';
import '../../../manger/customer_details_cubit.dart';

pw.Widget buildCustomerDetailTable({
  required context,
}) {
  List headers = [
    S.of(context).thePrice,
    S.of(context).date,
    S.of(context).theType,
  ];

  final List<AddProductAndDeductionModel> allDetailsItems =
      BlocProvider.of<CustomerDetailsCubit>(context)
          .customerProductDetails!
          .productsAndDeductionDetails;
  final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

  final data = allDetailsItems.map((item) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(item.dateTime!);
    bool productNameIsArabic =
        item.productNameOrByWho!.contains(RegExp(r'[\u0600-\u06FF]'));
    return isArabic
        ? [
            pw.Text(
              item.productNameOrByWho!,
              style: pw.TextStyle(
                font:
                    productNameIsArabic ? PdfService.arFont : PdfService.enFont,
              ),
              textDirection: productNameIsArabic
                  ? pw.TextDirection.rtl
                  : pw.TextDirection.ltr,
              textAlign:
                  productNameIsArabic ? pw.TextAlign.right : pw.TextAlign.left,
            ),
            pw.Text(
              formattedDate,
              style: pw.TextStyle(
                font: isArabic ? PdfService.arFont : PdfService.enFont,
              ),
            ),
            pw.Text(
              item.money!,
              style: pw.TextStyle(
                font: isArabic ? PdfService.arFont : PdfService.enFont,
              ),
            ),
          ]
        : [
            pw.Text(
              item.money!,
              style: pw.TextStyle(
                font: isArabic ? PdfService.arFont : PdfService.enFont,
              ),
            ),
            pw.Text(
              formattedDate,
              style: pw.TextStyle(
                font: isArabic ? PdfService.arFont : PdfService.enFont,
              ),
            ),
            pw.Text(
              item.productNameOrByWho!,
              style: pw.TextStyle(
                font:
                    productNameIsArabic ? PdfService.arFont : PdfService.enFont,
              ),
              textDirection: productNameIsArabic
                  ? pw.TextDirection.rtl
                  : pw.TextDirection.ltr,
              textAlign:
                  productNameIsArabic ? pw.TextAlign.right : pw.TextAlign.left,
            ),
          ];
  }).toList();

  return pw.TableHelper.fromTextArray(
    headers: isArabic ? headers.reversed.toList() : headers,
    data: data,
    border: null,
    cellAlignment: pw.AlignmentDirectional.centerStart,
    headerStyle: pw.TextStyle(
      fontWeight: pw.FontWeight.bold,
      font: isArabic ? PdfService.arFont : PdfService.enFont,
    ),
    headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
    cellHeight: 30,
    cellAlignments: {
      0: pw.AlignmentDirectional.center,
      1: pw.AlignmentDirectional.center,
      2: pw.AlignmentDirectional.center,
    },
  );
}
