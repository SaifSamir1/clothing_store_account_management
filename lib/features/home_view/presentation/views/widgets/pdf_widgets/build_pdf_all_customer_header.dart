import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../../../../core/caching/hive/my_box.dart';
import '../../../../../../generated/l10n.dart';

Widget buildAllCustomerHeader(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: .5 * PdfPageFormat.cm),
      Text(
        '${myBox!.get("countryName")}',
        style: const TextStyle(fontSize: 18),
      ),
      SizedBox(height: .5 * PdfPageFormat.cm),
      Text(
        S.of(context).customerDetails,
        style: const TextStyle(fontSize: 15),
      ),
      SizedBox(height: 1 * PdfPageFormat.cm),
    ],
  );
}
