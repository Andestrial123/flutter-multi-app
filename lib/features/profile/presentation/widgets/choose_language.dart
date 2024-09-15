import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_app/utils/colors.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  ChooseLanguageState createState() => ChooseLanguageState();
}

class ChooseLanguageState extends State<ChooseLanguage> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    selectedLanguage = context.locale.languageCode == 'en' ? 'English' : 'Ukrainian';

    return Dialog(
      alignment: Alignment.centerRight,
      surfaceTintColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      backgroundColor: CustomColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption('English'),
            const SizedBox(height: 8),
            _buildLanguageOption('Ukrainian'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String language) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedLanguage = language;
          if (context.locale == const Locale('en', 'US')) {
            context.setLocale(const Locale('uk', 'UA'));
          } else {
            context.setLocale(const Locale('en', 'US'));
          }
        });
        Navigator.of(context).pop(language);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedLanguage == language
              ? CustomColors.whiteColor.withOpacity(0.2)
              : Colors.transparent,
          border: Border.all(
            color: Colors.black,
            width: selectedLanguage == language ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              language,
              style: TextStyle(
                color: selectedLanguage == language
                    ? Colors.brown
                    : Colors.black,
                fontWeight: selectedLanguage == language
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 18,
              ),
            ),
            if (selectedLanguage == language)
              const Icon(
                Icons.check,
                color: Colors.brown,
              ),
          ],
        ),
      ),
    );
  }
}