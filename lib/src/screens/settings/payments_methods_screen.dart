import 'package:ebloqs_app/src/screens/settings/add_card_screen.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:ebloqs_app/src/widgets/custom_appBar_pop_question.dart';
import 'package:ebloqs_app/src/widgets/custom_payment_method.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  static const String routeName = 'PaymentMethodsScreen';
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  bool isSelected = false;
  bool principal = false;
  bool secundario = false;
  bool load = false;
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
                text: 'Métodos de pago',
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
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomPaymentMethod(
                size: size,
                isSelected: isSelected,
                isVisa: false,
                principal: principal,
                image: 'assets/Vectores/Iconos/mastercard_logo.svg',
                method: "Método Principal",
                number: '4254',
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    secundario = !secundario;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomPaymentMethod(
                size: size,
                isSelected: isSelected,
                principal: principal,
                isVisa: true,
                image: 'assets/png/visa.png',
                method: "Método Secundario",
                number: '0182',
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    secundario = !secundario;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.0197044334975369,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: CustomPaymentMethod(
                size: size,
                isSelected: isSelected,
                principal: principal,
                isVisa: false,
                image: 'assets/Vectores/Iconos/mastercard_logo.svg',
                method: "Método Secundario",
                number: '2810',
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                    principal = !principal;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.240147783251232,
                  left: size.width * 0.04,
                  right: size.width * 0.04),
              child: ButtonPrimary(
                  width: size.width,
                  title: 'Agregar método de pago',
                  onPressed: () {
                    Navigator.pushNamed(context, AddCardAcreen.routeName);
                  },
                  load: load),
            )
          ],
        ),
      ),
    );
  }
}
