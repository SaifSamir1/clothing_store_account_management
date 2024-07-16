import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';


class PdfService {
  static late Font arFont;
  static init ()async{
    arFont = Font.ttf((await rootBundle.load('assets/fonts/Cairo-Regular.ttf')));
  }


  //we call this method to generate the PDF file and save it
  //this file to write arabic
  static Future<File> generate({required List<
      Widget> pagesContent, required Widget footerContent }) async {
    Document pdf = Document();
    pdf.addPage(MultiPage(
      // textDirection: TextDirection.rtl,
      // theme: ThemeData.withFont(
      //   base: arFont
      // ),
      build: (context) => pagesContent,
      footer: (context) => footerContent,
    ));

    return PdfApi.saveDocument(name: 'customers.pdf', pdf: pdf);
  }
}

class PdfApi{
  // this function will save the pdf file and provide path for it
  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }


  //this function to open the pdf file on the device
  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }
}