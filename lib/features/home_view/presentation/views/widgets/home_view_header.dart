import 'package:account_mangment_responsive/core/utils/app_router.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/refresh_icon.dart';

class HomeViewHeader extends StatelessWidget {
  const HomeViewHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ' - ${S.of(context).customersNames}',
          style: AppStyles.styleSemiBold24WithoutFontFamily(context),
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetAllCustomerLoading ||
                state is GetAllCustomerSuccess ||
                state is GetAllCustomerError ||
                state is StopSearch ||
                state is StartSearch ||
                state is ClearSearch ||
                state is GetUserInfoSuccess
            ) {
              return RefreshIcon(
                onPressed: () {
                  BlocProvider.of<HomeCubit>(context).getAllCustomers();
                },
              );
            } else {
              return const SizedBox();
            }
          },
        )
      ],
    );
  }
}
