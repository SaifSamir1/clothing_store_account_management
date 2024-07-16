import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

Widget buildCustomerDetailsTable(
    {required List<dynamic> lastPaidDate, required context}) {
  final headers = [
    'number',
    'customer name',
    'The money',
    'date',
  ];

  int index = 0;
  List<CustomerModel> customers =
      BlocProvider.of<HomeCubit>(context).allCustomersDetails.allCustomer;
  final data = customers.map((customer) {
    index += 1;
    return [
      index,
      customer.customerName,
      customer.money,
      lastPaidDate[index - 1],
    ];
  }).toList();

  return TableHelper.fromTextArray(
    headers: headers,
    data: data,
    border: null,
    headerStyle: TextStyle(fontWeight: FontWeight.bold),
    headerDecoration: const BoxDecoration(color: PdfColors.grey300),
    cellHeight: 30,
    cellAlignments: {
      0: Alignment.centerLeft,
      1: Alignment.centerLeft,
      2: Alignment.centerLeft,
      3: Alignment.centerLeft,
    },
  );
}
