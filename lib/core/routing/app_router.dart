import 'package:account_mangment_responsive/features/auth_view/presentaion/views/auth_screen_signup.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/country_name.dart';
import 'package:account_mangment_responsive/features/home_view/data/reposetry/home_repo_impl.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/manger/home_cubit.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/add_and_edit_customer/presentation/views/add_customer_view.dart';
import '../../features/add_and_edit_customer/presentation/views/edit_customere_view.dart';
import '../../features/add_product_and_deduction/presentaion/views/add_product_view.dart';
import '../../features/add_product_and_deduction/presentaion/views/deduction_product_view.dart';
import '../../features/auth_view/presentaion/views/auth_screen_signin.dart';
import '../../features/customer_detailes/data/models/all_details_for_the_customer_model.dart';
import '../../features/customer_detailes/data/models/all_new_details_for_the_customer.dart';
import '../../features/customer_detailes/data/repositry/customer_details_repo_impl.dart';
import '../../features/customer_detailes/presentation/manger/customer_details_cubit.dart';
import '../../features/customer_detailes/presentation/view/customer_detailes_view.dart';
import 'routes.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => const AuthScreenSignUp(),
      ),
      GoRoute(
        path: Routes.signIn,
        builder: (context, state) => const AuthScreenSignIn(),
      ),
      GoRoute(
          path: Routes.homeView,
          builder: (context, state) {
            return BlocProvider(
                create: (context) => HomeCubit(HomeRepoImpl()),
                child: const HomeView());
          }),
      GoRoute(
        path: Routes.selectTheDay,
        builder: (context, state) => const SelectTheDayView(),
      ),
      GoRoute(
        path: Routes.addCustomer,
        builder: (context, state) => const AddCustomerView(),
      ),
      GoRoute(
        path: Routes.editCustomer,
        builder: (context, state) => EditCustomerView(
          allDetailsForTheCustomerModel:
          state.extra as AllDetailsForTheCustomerModel,
        ),
      ),
      GoRoute(
        path: Routes.customerDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => CustomerDetailsCubit(
            CustomerDetailsRepoImpl(),
          ),
          child: CustomerDetailsView(
            allDetailsForTheCustomerModel:
            state.extra as AllDetailsForTheCustomerModel,
          ),
        ),
      ),
      GoRoute(
        path: Routes.addProductView,
        builder: (context, state) => AddProductView(
          allDetailsForTheCustomerModel:
          state.extra as AllNewDetailsForTheCustomerModel,
        ),
      ),
      GoRoute(
        path: Routes.deductionView,
        builder: (context, state) => DeductionView(
          allDetailsForTheCustomerModel:
          state.extra as AllNewDetailsForTheCustomerModel,
        ),
      ),
    ],
  );
}
