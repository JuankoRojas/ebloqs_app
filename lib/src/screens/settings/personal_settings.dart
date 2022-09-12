import 'package:ebloqs_app/src/screens/legal/privacy_policy_screen.dart';
import 'package:ebloqs_app/src/screens/legal/therms_conditions_screen.dart';
import 'package:ebloqs_app/src/screens/settings/personal_information_screen.dart';
import 'package:ebloqs_app/src/widgets/custom_appbar_pop_question.dart';
import 'package:ebloqs_app/src/widgets/custom_personal_setting.dart';
import 'package:flutter/material.dart';

class PersonalSettingsScreen extends StatefulWidget {
  static const String routeName = 'PersonalSettingsScreen';
  const PersonalSettingsScreen({super.key});

  @override
  State<PersonalSettingsScreen> createState() => _PersonalSettingsScreenState();
}

class _PersonalSettingsScreenState extends State<PersonalSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0738916256157636,
                left: size.width * 0.064,
                right: size.width * 0.0426666666666667),
            child: const CustomAppbarWithPopAndQuestion(
              text: 'Ajustes',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.0344827586206897),
            child: Container(
              width: size.width,
              height: 0.50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xffc9d1d1),
                  width: 0.50,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0431034482758621,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalSetting(
              size: size,
              setting: 'Idioma',
              value: 'Español',
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0431034482758621,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalSetting(
              size: size,
              setting: 'Moneda',
              value: 'USD',
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0431034482758621,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalSetting(
              size: size,
              setting: 'Información personal',
              value: '',
              onTap: () {
                Navigator.pushNamed(
                    context, PersonalInformationScreen.routeName);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0431034482758621,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalSetting(
              size: size,
              setting: 'Términos y condiciones',
              value: '',
              onTap: () {
                Navigator.pushNamed(context, ThermsConditionsScreen.routeName);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0431034482758621,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalSetting(
              size: size,
              setting: 'Políticas de privacidad',
              value: '',
              onTap: () {
                Navigator.pushNamed(context, PrivacyPolicyScreen.routeName);
              },
            ),
          ),
        ],
      )),
    );
  }
}
