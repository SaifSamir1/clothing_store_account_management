
import 'package:account_mangment_responsive/features/settings/ui/widgets/translate_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/caching/hive/my_box.dart';
import '../../../../core/cubits/language_cubit/language_cubit.dart';
import '../../../../core/utils/constant.dart';
import '../../../../generated/l10n.dart';


class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.language, color: defaultColor),
      title: Text(
        S.of(context).changeLang,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        _showLanguageDialog(context);
      },
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).selectLang),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildLanguageOption(
                context,
                languageCode: 'en',
                languageName: 'English',
              ),
              _buildLanguageOption(
                context,
                languageCode: 'ar',
                languageName: 'العربية',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(BuildContext context,
      {required String languageCode, required String languageName}) {
    final currentLanguageCode =
        context.watch<LanguageCubit>().state.locale.languageCode;
    final isSelected = currentLanguageCode == languageCode;

    return ListTile(
      leading: Icon(
        Icons.language,
        color: isSelected ? defaultColor : Colors.grey,
      ),
      title: Text(
        languageName,
        style: TextStyle(
          color: isSelected ? defaultColor : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: isSelected
          ? Icon(
        Icons.check,
        color: defaultColor,
      )
          : null,
      onTap: () {
        context.read<LanguageCubit>().changeLanguage(languageCode);
        if(languageCode == 'en')
          {
            myBox!.put("countryName", translateDayNameToEng());
          }
        if(languageCode == 'ar')
        {
          myBox!.put("countryName", translateDayNameToArabic());
        }
        Navigator.of(context).pop();
      },
    );
  }
}
