import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:ebloqs_app/src/global/util_size.dart';
import 'package:ebloqs_app/src/providers/user_info_provider.dart';
import 'package:ebloqs_app/src/services/auth_user_service.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
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

class _PersonalInformationScreenState extends State<PersonalInformationScreen>
    with AfterLayoutMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool editName = false;
  bool editLastName = false;
  bool editEmail = false;
  bool editPhone = false;
  FocusNode nameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  bool isloading = false;
  String? nationality;
  String? birthdayDate;
  String? DniNumber;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    final user =
        Provider.of<UserInfoProvider>(context, listen: false).userInfoget;
    setState(() {
      nameController.text = user["name"][0].toUpperCase() +
              user["name"].substring(1).toLowerCase() ??
          '';
      lastNameController.text = user["lastName"][0].toUpperCase() +
              user["lastName"].substring(1).toLowerCase() ??
          '';
      emailController.text = user["email"] ?? '';
      phoneController.text = user["phone"] ?? '';
      nationality = user["nationality"] ?? '';
      birthdayDate = user["birthdayDate"] ?? '';
      DniNumber = user["DniNumber"] ?? '';
    });
  }

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
                value: nameController,
                isEditable: editName,
                focusNode: nameFocus,
                firstFocus: editName,
                onTap: () {
                  setState(() {
                    editName = !editName;

                    nameFocus.requestFocus();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0344827586206897,
                  left: size.width * 0.064,
                  right: size.width * 0.064),
              child: CustomPersonalInfo(
                field: 'Apellidos',
                value: lastNameController,
                focusNode: lastNameFocus,
                firstFocus: false,
                onTap: () {
                  setState(() {
                    editLastName = !editLastName;

                    lastNameFocus.requestFocus();
                  });
                },
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
                value: emailController,
                focusNode: emailFocus,
                firstFocus: false,
                onTap: () {
                  setState(() {
                    editEmail = !editEmail;

                    emailFocus.requestFocus();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0344827586206897,
                  left: size.width * 0.064,
                  right: size.width * 0.064),
              child: CustomPersonalInfo(
                field: 'Número de celular',
                value: phoneController,
                focusNode: phoneFocus,
                firstFocus: false,
                onTap: () {
                  setState(() {
                    editPhone = !editPhone;

                    phoneFocus.requestFocus();
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: UtilSize.height(200, context),
                  left: UtilSize.width(15, context),
                  right: UtilSize.width(14, context)),
              child: ButtonPrimary(
                width: size.width,
                title: 'Guardar cambios',
                onPressed: () async {
                  setState(() {
                    isloading = true;
                  });
                  final response = await AuthUserService().personalData(
                      accesstoken: Preferences.token!,
                      nationality: nationality!,
                      name: nameController.text,
                      lastname: lastNameController.text,
                      birthdayDate: birthdayDate!,
                      phoneNumber: phoneController.text,
                      dniNumber: DniNumber!);
                  if (response.runtimeType != String &&
                      response['message'] == "user Updated") {
                    var userInfo = await AuthUserService()
                        .getUserInfo(accesstoken: Preferences.token!);
                    Future.delayed(Duration.zero).then((_) =>
                        Provider.of<UserInfoProvider>(context, listen: false)
                            .userInfoSet(userInfo));
                    Future.delayed(Duration.zero)
                        .then((_) => Navigator.pop(context));
                    setState(() {
                      isloading = false;
                    });
                  }
                },
                load: isloading,
                disabled: isloading,
              ),
            )
          ],
        ),
      ),
    );
  }
}
