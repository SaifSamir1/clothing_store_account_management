
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProductAndDeductionModel
{
  String? productNameOrByWho;
  String? money;
  DateTime? dateTime;
  String? paidOrProduct;

  AddProductAndDeductionModel({
    this.productNameOrByWho,
    this.money,
    this.dateTime,
    this.paidOrProduct,
  });

  AddProductAndDeductionModel.fromjson(Map<String,dynamic> json)
  {
    productNameOrByWho =json['productNameOrByWho'];
    money =json['money'];
    paidOrProduct =json['paidOrProduct'];
    dateTime =(json["dateTime"] as Timestamp).toDate();

  }
  //دي كأنها متغير ماسك فيها البيانات اللي هستخدمها
  Map<String,dynamic> toJson()
  {
    return {
      'productNameOrByWho' : productNameOrByWho,
      'money':money,
      'dateTime':dateTime,
      'paidOrProduct':paidOrProduct,
    };
  }
}
