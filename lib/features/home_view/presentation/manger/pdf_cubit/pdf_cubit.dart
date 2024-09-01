
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/reposetry/home_repo.dart';

part 'pdf_state.dart';

class PdfCubit extends Cubit<PdfState> {
  PdfCubit(this.homeRepo) : super(PdfInitial());

  HomeRepo homeRepo;

  List<dynamic> paidDate =[];
  Future<void> getCustomerLastPaidDate(
      {required List<QueryDocumentSnapshot<Object?>> allCustomers,context}) async {
    emit(GetLastDateForCustomerPaidLoading());
    Either<Exception, DateTime> result;
    for(QueryDocumentSnapshot<Object?> element in allCustomers){
      result = await homeRepo.getCustomerLastPaidDate(customerId:element.id,);
      result.fold((error) {
        paidDate.add(S.of(context).noPaid);
      }, (lastDate) {
        String formattedDate = DateFormat('yyyy-MM-dd').format(lastDate);
        paidDate.add(formattedDate);
      });
    }
    emit(GetLastDateForCustomerPaidSuccess(getLastDateForCustomerPaid: paidDate));
  }
}
