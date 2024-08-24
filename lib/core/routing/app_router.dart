import 'package:account_mangment_responsive/core/routing/animation_route.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/auth_screen_signup.dart';
import 'package:account_mangment_responsive/features/auth_view/presentaion/views/country_name.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/account_total_mony_screen.dart';
import 'package:account_mangment_responsive/features/home_view/presentation/views/home_view.dart';
import 'package:account_mangment_responsive/features/settings/ui/setting_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/add_and_edit_customer/presentation/views/add_customer_view.dart';
import '../../features/add_and_edit_customer/presentation/views/edit_customere_view.dart';
import '../../features/add_product_and_deduction/presentaion/views/add_product_view.dart';
import '../../features/add_product_and_deduction/presentaion/views/deduction_product_view.dart';
import '../../features/auth_view/presentaion/views/auth_screen_signin.dart';
import '../../features/auth_view/presentaion/views/forget_password_screen.dart';
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
        pageBuilder: (context, state) {
          return fadeTransitionPage(const AuthScreenSignUp());
        },
      ),
      GoRoute(
        path: Routes.signIn,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const AuthScreenSignIn());
        },
      ),
      GoRoute(
        path: Routes.homeView,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const HomeView());
        },
      ),
      GoRoute(
        path: Routes.selectTheDay,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const SelectTheDayView());
        },
      ),
      GoRoute(
        path: Routes.addCustomer,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const AddCustomerView());
        },
      ),
      GoRoute(
        path: Routes.editCustomer,
        pageBuilder: (context, state) {
          return fadeTransitionPage(EditCustomerView(
            allDetailsForTheCustomerModel:
                state.extra as AllDetailsForTheCustomerModel,
          ));
        },
      ),
      GoRoute(
        path: Routes.customerDetailsView,
        pageBuilder: (context, state) {
          final allData  = state.extra as AllDetailsForTheCustomerModel;
          return fadeTransitionPage(
            BlocProvider(
              create: (context) => CustomerDetailsCubit(
                CustomerDetailsRepoImpl(),
              )..getCustomerDetailsBody(customerId: allData.customerId)..getCustomerInfo(customerId: allData.customerId),
              child: CustomerDetailsView(
                allDetailsForTheCustomerModel:
                allData,
              ),
            ),
          );
        },
      ),
      GoRoute(
        path: Routes.addProductView,
        pageBuilder: (context, state) {
          return fadeTransitionPage(AddProductView(
            allDetailsForTheCustomerModel:
                state.extra as AllNewDetailsForTheCustomerModel,
          ));
        },
      ),
      GoRoute(
        path: Routes.deductionView,
        pageBuilder: (context, state) {
          return fadeTransitionPage(DeductionView(
            allDetailsForTheCustomerModel:
                state.extra as AllNewDetailsForTheCustomerModel,
          ));
        },
      ),
      GoRoute(
        path: Routes.totalAmount,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const AccountTotalMoneyScreen());
        },
      ),
      GoRoute(
        path: Routes.settingScreen,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const SettingsScreen());
        },
      ),
      GoRoute(
        path: Routes.forgetPasswordScreen,
        pageBuilder: (context, state) {
          return fadeTransitionPage(const ForgotPasswordScreen());
        },
      ),
    ],
  );
}
