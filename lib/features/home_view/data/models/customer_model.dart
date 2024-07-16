






import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerModel
{
  String? customerName;
  String? phone;
  int? money;
  DateTime? dateTime;

  CustomerModel({
    this.customerName,
    this.phone,
    this.money,
    this.dateTime,
  });
  CustomerModel.fromjson(Map<String,dynamic> json)
  {
    customerName =json['customerName'];
    phone =json['phone'];
    money =json['money'];
    dateTime =(json["dateTime"] as Timestamp).toDate();
  }
  //دي كأنها متغير ماسك فيها البيانات اللي هستخدمها
  Map<String,dynamic> toJson()
  {
    return {
      'customerName':customerName,
      'phone':phone,
      'money':money,
      'dateTime':dateTime,
    };
  }
}
