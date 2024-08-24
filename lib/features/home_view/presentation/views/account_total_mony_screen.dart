import 'package:account_mangment_responsive/features/add_and_edit_customer/presentation/views/widgets/custom_app_bar.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/constant.dart';

class AccountTotalMoneyScreen extends StatelessWidget {
  const AccountTotalMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            CustomAppBar(
              title: 'Total amount for the day',
              icon: Icons.money,
              backButtonOnPressed: () {
                GoRouter.of(context).pop();
              },
            ),
            const Spacer(),
            Text(
              "Total Amount",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: defaultColor.withOpacity(.8),
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                '\$${allMoney(context)}',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                backgroundColor: defaultColor,
              ),
              child: const Text(
                'Back',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
  int allMoney(BuildContext context) {
    int sum = 0;
    for (int i = 0; i < BlocProvider.of<HomeCubit>(context).allCustomersDetails.allCustomer.length; i++) {
      sum += BlocProvider.of<HomeCubit>(context).allCustomersDetails.allCustomer[i].money!;
    }
    return sum;
  }
}
