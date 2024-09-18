import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constant.dart';
import '../../../../generated/l10n.dart';

class AccountTotalMoneyScreen extends StatelessWidget {
  const AccountTotalMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        backgroundColor: defaultColor,
        title: Text(S.of(context).totalAccount,style: const TextStyle(
          color: Colors.white
        )),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Spacer(),
              Text(
              S.of(context).amount,
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
                  color: defaultColor.withOpacity(.9),
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
            ],
          ),
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
