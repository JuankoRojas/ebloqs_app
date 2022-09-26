import 'dart:async';
import 'dart:io';

import 'package:after_layout/after_layout.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_appbar_pop_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceManagementScreen extends StatefulWidget {
  static const String routeName = 'DeviceManagementScreen';
  const DeviceManagementScreen({super.key});

  @override
  State<DeviceManagementScreen> createState() => _DeviceManagementScreenState();
}

class _DeviceManagementScreenState extends State<DeviceManagementScreen>
    with AfterLayoutMixin<DeviceManagementScreen> {
  String? brand;
  String? device;
  String? ip;
  bool load = false;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    printIps();
    setState(() {
      brand = androidInfo.brand;
      device = androidInfo.device;
    });

    // IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    // print('Running on ${iosInfo.utsname.machine}');
  }

  Future printIps() async {
    for (var interface in await NetworkInterface.list()) {
      print('== Interface: ${interface.name} ==');
      for (var addr in interface.addresses) {
        print(
            '${addr.address} ${addr.host} ${addr.isLoopback} ${addr.rawAddress} ${addr.type.name}');
        setState(() {
          ip = addr.address;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0738916256157636,
                  left: size.width * 0.064,
                  right: size.width * 0.0426666666666667),
              child: const CustomAppbarWithPopAndQuestion(
                text: "Gestión de dispositivos",
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.0344827586206897),
              child: SizedBox(
                width: size.width * 0.92,
                child: const Text(
                  "Estos dispositivos están actualmente autorizados para acceder a tu cuenta. ",
                  style: TextStyle(
                    color: Color(0xff170658),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0344827586206897,
                  left: size.width * 0.064,
                  right: size.width * 0.0426666666666667),
              child: Row(
                children: [
                  SvgPicture.asset('assets/Vectores/Iconos/phone.svg'),
                  Text(
                    device?.toUpperCase() ?? '',
                    style: const TextStyle(
                      color: Color(0xff170658),
                      fontSize: 14,
                      fontFamily: "Archivo",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(child: Container()),
                  SvgPicture.asset('assets/Vectores/Iconos/edit.svg')
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.064,
                  right: size.width * 0.0426666666666667),
              child: Row(
                children: [
                  const Text(
                    "Fecha:",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "22/08/2022 - 19:25 PM",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xff170658).withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.064,
                  right: size.width * 0.0426666666666667),
              child: Row(
                children: [
                  const Text(
                    "Ubicación:",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Quito-Ecuador",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xff170658).withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.064,
                  right: size.width * 0.0426666666666667),
              child: Row(
                children: [
                  const Text(
                    "Dirección IP:",
                    style: TextStyle(
                      color: Color(0xff170658),
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    ip ?? '',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: const Color(0xff170658).withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.431034482758621,
                  left: size.width * 0.064,
                  right: size.width * 0.0426666666666667),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: ButtonPrimary(
                    width: size.width,
                    title: 'Guardar cambios',
                    onPressed: () {},
                    load: load),
              ),
            )
          ],
        ));
  }
}