import 'package:auto_size_text/auto_size_text.dart';
import 'package:ebloqs_app/src/global/util_size.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonPrimaryOutline extends StatefulWidget {
  double width;
  String title;
  VoidCallback onPressed;
  bool load;
  bool disabled = false;

  ButtonPrimaryOutline({
    Key? key,
    required this.width,
    required this.title,
    required this.onPressed,
    required this.load,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<ButtonPrimaryOutline> createState() => _ButtonPrimaryOutlineState();
}

class _ButtonPrimaryOutlineState extends State<ButtonPrimaryOutline> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
        //  Padding(
        // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
        // child:
        GestureDetector(
      onTap: widget.onPressed,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: UtilSize.height(52, context),
              width: widget.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: !widget.disabled
                    ? const [
                        BoxShadow(
                          color: Color(0x3f000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: !widget.disabled
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xff170658),
                          width: 2,
                        ),
                      ),
                    )
                  : const SizedBox(),
            ),
            Center(
              child: !widget.load
                  ? AutoSizeText(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: !widget.disabled
                            ? const Color(0xff170658)
                            : Colors.grey[600],
                        fontSize: 14,
                        fontFamily: "Archivo",
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : const SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.black87),
                      ),
                    ),
            )
          ],
        ),
      ),
      //),
    );
  }
}
