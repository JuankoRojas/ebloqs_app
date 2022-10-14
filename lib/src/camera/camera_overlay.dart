import 'package:auto_size_text/auto_size_text.dart';
import 'package:camera/camera.dart';
import 'package:ebloqs_app/src/camera/overlay_shape.dart';

import 'package:ebloqs_app/src/models/camera_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef XFileCallback = void Function(XFile file);

class CameraOverlay extends StatefulWidget {
  const CameraOverlay(
    this.camera,
    this.model,
    this.onCapture, {
    Key? key,
    this.flash = false,
    this.enableCaptureButton = true,
    this.label,
    this.info,
    this.loadingWidget,
    this.infoMargin,
  }) : super(key: key);
  final CameraDescription camera;
  final OverlayModel model;
  final bool flash;
  final bool enableCaptureButton;
  final XFileCallback onCapture;
  final String? label;
  final String? info;
  final Widget? loadingWidget;
  final EdgeInsets? infoMargin;

  @override
  _FlutterCameraOverlayState createState() => _FlutterCameraOverlayState();
}

class _FlutterCameraOverlayState extends State<CameraOverlay> {
  _FlutterCameraOverlayState();

  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.camera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget loadingWidget = widget.loadingWidget ??
        Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: const Align(
            alignment: Alignment.center,
            child: AutoSizeText('loading camera'),
          ),
        );

    if (!controller.value.isInitialized) {
      return loadingWidget;
    }

    controller
        .setFlashMode(widget.flash == true ? FlashMode.auto : FlashMode.off);
    return Stack(
      alignment: Alignment.bottomCenter,
      fit: StackFit.expand,
      children: [
        CameraPreview(controller),
        OverlayShape(widget.model),
        if (widget.label != null || widget.info != null)
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                margin: widget.infoMargin ??
                    EdgeInsets.only(
                        top: size.height * 0.12,
                        left: size.width * 0.048,
                        right: size.width * 0.048),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.label != null)
                      AutoSizeText(
                        widget.label!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    if (widget.info != null)
                      Flexible(
                        child: AutoSizeText(
                          widget.info!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                  ],
                )),
          ),
        if (widget.enableCaptureButton)
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
                color: Colors.transparent,
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black12,
                      shape: BoxShape.circle,
                    ),
                    margin: const EdgeInsets.all(25),
                    child: IconButton(
                      enableFeedback: true,
                      color: Colors.white,
                      onPressed: () async {
                        for (int i = 10; i > 0; i--) {
                          await HapticFeedback.vibrate();
                        }

                        XFile file = await controller.takePicture();
                        widget.onCapture(file);
                      },
                      icon: Container(
                        width: 72,
                        height: 72,
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: Container(
                          width: 72,
                          height: 72,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      iconSize: 72,
                    ))),
          ),
      ],
    );
  }
}
