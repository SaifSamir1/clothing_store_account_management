import 'package:pdf/widgets.dart';

Widget buildCustomerFooter() {
  return Column(children: [
    Divider(),
    Row(
      children: [
        Column(children: [
          Text(
            'Samir Saif ',
            style: const TextStyle(fontSize: 15),
          ),
          SizedBox(height: 5),
          Text(
            '01286620206',
            style: const TextStyle(fontSize: 10),
          ),
        ]),
        Spacer(),
        Text(
            '${DateTime.now().month} / ${DateTime.now().day} / ${DateTime.now().year}'),
        SizedBox(width: 10),
      ],
    )
  ]);
}
