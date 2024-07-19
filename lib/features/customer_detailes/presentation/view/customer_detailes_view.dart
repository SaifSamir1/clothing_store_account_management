import 'package:account_mangment_responsive/features/customer_detailes/presentation/view/widgets/customer_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constant.dart';
import '../../data/models/all_details_for_the_customer_model.dart';
import '../manger/customer_details_cubit.dart';

class CustomerDetailsView extends StatefulWidget {
  const CustomerDetailsView(
      {super.key, required this.allDetailsForTheCustomerModel});

  final AllDetailsForTheCustomerModel allDetailsForTheCustomerModel;

  @override
  State<CustomerDetailsView> createState() => _CustomerDetailsViewState();
}

class _CustomerDetailsViewState extends State<CustomerDetailsView> {
  late Future<void> _fetchData;

  @override
  void initState() {
    super.initState();
    _fetchData = _getCustomerDetailsBody();
  }

  Future<void> _getCustomerDetailsBody() async {
    var homeCubit = BlocProvider.of<CustomerDetailsCubit>(context);
    await homeCubit.getCustomerDetailsBody(
      customerId: widget.allDetailsForTheCustomerModel.customerId,
    );
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return FutureBuilder(
        future: _fetchData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: defaultColor,
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Scaffold(
              key: scaffoldKey,
              backgroundColor: const Color(0xffFFFFFF),
              body: SafeArea(
                child: CustomerDetailsViewBody(
                  allDetailsForTheCustomerModel:
                      widget.allDetailsForTheCustomerModel,
                ),
              ),
            );
          }
        });
  }
}
