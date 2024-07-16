import 'package:account_mangment_responsive/features/auth_view/presentaion/manger/auth_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDayDropDownButton extends StatelessWidget {
  const SelectDayDropDownButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return DropdownButton(
          hint: Text(S.of(context).selTheday),
          items: [
            S.of(context).saturday,
            S.of(context).sunday,
            S.of(context).monday,
            S.of(context).tuesday,
            S.of(context).wednesday,
            S.of(context).thursday,
            S.of(context).friday
          ]
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ))
              .toList(),
          onChanged: (String? value) {
            BlocProvider.of<AuthCubit>(context).changeDropdownButton(
                dayShow: value, trueDay: selectedValue(value!));
          },
          value: BlocProvider.of<AuthCubit>(context).selectedName,
        );
      },
    );
  }

  String selectedValue(String value) {
    late String trueValue;
    switch (value) {
      case "Saturday":
      case "السبت":
        trueValue = "Saturday";
        break;
      case "Sunday":
      case "الأحد":
        trueValue = "Sunday";
        break;
      case "Monday":
      case "الاثنين":
        trueValue = "Monday";
        break;
      case "Tuesday":
      case "الثلاثاء":
        trueValue = "Tuesday";
        break;
      case "Wednesday":
      case "الأربعاء":
        trueValue = "Wednesday";
        break;
      case "Thursday":
      case "الخميس":
        trueValue = "Thursday";
        break;
      case "Friday":
      case "الجمعة":
        trueValue = "Friday";
        break;
      default:
        trueValue = "Invalid day";
    }
    return trueValue;
  }
}
