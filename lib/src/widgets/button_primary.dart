import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonPrimary extends StatefulWidget {
  String title;
  VoidCallback onPressed;
  bool load;
  bool disabled = false;

  ButtonPrimary({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.load,
    this.disabled = false,
  }) : super(key: key);

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              height: 52,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFF6F4FD),
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
                  ? Image.asset(
                      'assets/png/buttongradient.png',
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(),
            ),
            Center(
              child: !widget.load
                  ? Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            !widget.disabled ? Colors.white : Colors.grey[600],
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
    );
  }
}
