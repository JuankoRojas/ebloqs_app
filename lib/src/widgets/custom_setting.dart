import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSetting extends StatelessWidget {
  const CustomSetting({
    Key? key,
    required this.size,
    required this.setting,
    required this.onTap,
  }) : super(key: key);
  final String setting;
  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height * 0.0652709359605911,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: const Color(0xffeae4fc),
            width: 1,
          ),
          color: const Color(0xfff9f9fa),
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.048, right: size.width * 0.048),
          child: Row(
            children: [
              AutoSizeText(
                setting,
                style: const TextStyle(
                  color: Color(0xff170658),
                  fontSize: 14,
                ),
              ),
              Expanded(child: Container()),
              SvgPicture.asset('assets/Vectores/Iconos/chevronright.svg')
            ],
          ),
        ),
      ),
    );
  }
}
