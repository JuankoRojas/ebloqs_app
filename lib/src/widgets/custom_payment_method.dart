import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomPaymentMethod extends StatelessWidget {
  const CustomPaymentMethod({
    Key? key,
    required this.size,
    required this.isSelected,
    required this.principal,
    required this.image,
    required this.number,
    required this.method,
    this.onTap,
    required this.isVisa,
  }) : super(key: key);

  final Size size;
  final VoidCallback? onTap;
  final bool isVisa;
  final String image;
  final String number;
  final bool isSelected;
  final bool principal;
  final String method;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: (isSelected)
                ? const Color(0xff2504ca)
                : const Color(0xffDADADA),
            width: 2,
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0258620689655172,
                  left: size.width * 0.0373333333333333),
              child: Row(
                children: [
                  (isVisa)
                      ? Image.asset(
                          image,
                          width: 45,
                        )
                      : SvgPicture.asset(
                          image,
                        ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0533333333333333),
                    child: Text(
                      "●●●",
                      style: TextStyle(
                        color: const Color(0xff757575).withOpacity(0.5),
                        fontSize: 9,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: size.width * 0.0186666666666667),
                    child: Text(
                      number,
                      style: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 15,
                        fontFamily: "Kantumruy",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0369458128078818,
                  left: size.width * 0.0373333333333333,
                  bottom: size.height * 0.0172413793103448),
              child: Row(
                children: [
                  CupertinoSwitch(value: principal, onChanged: (value) {}),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: Text(
                      method,
                      style: const TextStyle(
                        color: Color(0xff170658),
                        fontSize: 13,
                        fontFamily: "Kantumruy",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.288),
                    child: SvgPicture.asset('assets/Vectores/Iconos/Trash.svg',
                        color: const Color(0xff2504ca)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
