import 'package:account_mangment_responsive/features/home_view/data/models/customer_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AllCustomersDetails {
  final List<CustomerModel> allCustomer;
  final List<QueryDocumentSnapshot> docs;

  AllCustomersDetails({required this.allCustomer, required this.docs});
}
