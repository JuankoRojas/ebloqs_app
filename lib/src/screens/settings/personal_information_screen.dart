import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/widgets/custom_appbar_pop_question.dart';
import 'package:ebloqs_app/src/widgets/custom_personal_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonalInformationScreen extends StatefulWidget {
  static const String routeName = 'PersonalInformationScreen';
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserInfoProvider>(context).userInfoget;
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
              text: 'Información personal',
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
                top: size.height * 0.0344827586206897,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalInfo(
              field: 'Nombre',
              value: user["name"] ?? '',
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0344827586206897,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalInfo(
              field: 'Apellidos',
              value: '${user["lastName"] ?? ''}',
              onTap: () {},
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(
          //       top: size.height * 0.0344827586206897,
          //       left: size.width * 0.064,
          //       right: size.width * 0.064),
          //   child: CustomPersonalInfo(
          //     field: 'Género',
          //     value: '',
          //     onTap: () {},
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0344827586206897,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalInfo(
              field: 'Email',
              value: '${user["email"] ?? ''}',
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.0344827586206897,
                left: size.width * 0.064,
                right: size.width * 0.064),
            child: CustomPersonalInfo(
              field: 'Número de celular',
              value: '${user["phone"] ?? ''}',
              onTap: () {},
            ),
          ),
        ],
      )),
    );
  }
}
