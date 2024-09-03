import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../../../../../../core/utils/pdf_service.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../data/models/all_details_for_the_customer_model.dart';

Widget buildCustomerHeader(context,AllDetailsForTheCustomerModel allDetailsForTheCustomerModel) {
  bool nameIsArabic =
  allDetailsForTheCustomerModel.customerDetails.customerName!.contains(RegExp(r'[\u0600-\u06FF]'));
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: .5 * PdfPageFormat.cm),
      Text(
        allDetailsForTheCustomerModel.customerDetails.customerName!,
        textDirection: nameIsArabic
            ? TextDirection.rtl
            : TextDirection.ltr,
        textAlign:
        nameIsArabic ?TextAlign.right : TextAlign.left,
        style: TextStyle(fontSize: 18,font:
        nameIsArabic ? PdfService.arFont : PdfService.enFont,),
      ),
      SizedBox(height: .3 * PdfPageFormat.cm),
      Row(
        children: [
          Text(
            S.of(context).FinalAccount,
            style: const TextStyle(fontSize: 15),
          ),
          SizedBox(width: .5 * PdfPageFormat.cm),
          Text(
            '${allDetailsForTheCustomerModel.customerDetails.money!}',
            style:  const TextStyle(fontSize: 18),
          ),
        ]
      ),
      SizedBox(height: 1 * PdfPageFormat.cm),
    ],
  );
}
