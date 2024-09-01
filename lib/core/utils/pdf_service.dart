import 'dart:io';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdf;

import 'package:flutter/material.dart';

class PdfService {
  static late pdf.Font arFont;
  static late pdf.Font enFont;

  // Initialize the fonts for both Arabic and English
  static Future<void> init() async {
    arFont = pdf.Font.ttf(await rootBundle.load('assets/fonts/Cairo-Regular.ttf'));
    enFont = pdf.Font.ttf(await rootBundle.load('assets/fonts/LibreCaslonText-Regular.ttf'));
  }

  // Generate the PDF file and save it
  static Future<File> generate({
    required List<pdf.Widget> pagesContent,
    required pdf.Widget footerContent,
    required  context, // Pass the context to access the app's locale
  }) async {
    final pdf.Document pdf2 = pdf.Document();

    final bool isArabic = Localizations.localeOf(context).languageCode == 'ar';

    pdf2.addPage(
      pdf.MultiPage(
        textDirection: isArabic ? pdf.TextDirection.rtl : pdf.TextDirection.ltr,
        theme: pdf.ThemeData.withFont(
          base: isArabic ? arFont : enFont,
        ),
        build: (context) => pagesContent,
        footer: (context) => footerContent,
      ),
    );

    return PdfApi.saveDocument(name: 'customers.pdf', pdf: pdf2);
  }
}
class PdfApi {
  // Save the PDF file and provide path for it
  static Future<File> saveDocument({
    required String name,
    required pdf.Document pdf,
  }) async {
    final bytes = await pdf.save();
    final dir = await getApplicationCacheDirectory();
    final file = File('${dir.path}/$name');

    await file.writeAsBytes(bytes);

    return file;
  }

  // Open the PDF file on the device
  static Future<void> openFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}