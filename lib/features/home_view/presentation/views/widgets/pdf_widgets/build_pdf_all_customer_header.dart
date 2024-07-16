import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../../../../core/utils/hive_service.dart';

Widget buildAllCustomerHeader() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: .5 * PdfPageFormat.cm),
      Text(
        '${myBox!.get("dayName")}',
        style: const TextStyle(fontSize: 18),
      ),
      SizedBox(height: .5 * PdfPageFormat.cm),
      Text(
        'Customers Details :',
        style: const TextStyle(fontSize: 15),
      ),
      SizedBox(height: 1 * PdfPageFormat.cm),
    ],
  );
}
