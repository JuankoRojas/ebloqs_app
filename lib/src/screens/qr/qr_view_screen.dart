import 'dart:io';

import 'package:ebloqs_app/src/providers/qr_info_provider.dart';
import 'package:ebloqs_app/src/screens/transfer/transfer_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrViewScreen extends StatefulWidget {
  const QrViewScreen({super.key});

  @override
  State<QrViewScreen> createState() => _QrViewScreenState();
}

class _QrViewScreenState extends State<QrViewScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: const Color(0xff00DAF8),
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
          ),
        ),
      ],
    ));
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    try {
      controller.scannedDataStream.listen((scanData) {
        if (scanData.code != null) {
          Future.delayed(Duration.zero).then((_) {
            setState(() {
            result = scanData;
            print('result:${result!.code}');
          });
          if (result!.code!.isNotEmpty) {
          Provider.of<QrInfoProvider>(context, listen: false)
              .setQr(result!.code);
          Navigator.pushNamed(
              context, TransferScreen.routeName);
        }
          
          });
        }

        
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
