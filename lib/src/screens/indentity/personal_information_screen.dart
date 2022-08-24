import 'package:country_list_pick/country_list_pick.dart';
import 'package:ebloqs_app/src/screens/indentity/address_screen.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:ebloqs_app/src/widgets/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';

class PersonalInformation extends StatefulWidget {
  static const routeName = 'PersonalInformation';
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  DateTime _selectedDate = DateTime.now();
  bool? isLoadLogin = false;
  final GlobalKey<FormState> _formKey11 = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var dateParse = DateTime.parse(_selectedDate.toString());

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    final List<Locale> systemLocales = WidgetsBinding.instance.window.locales;
    String? isoCountryCode = systemLocales.first.countryCode;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 60,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: systemBarDark,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              'assets/Vectores/Iconos/Arrow left.svg',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Text(
          "Información personal",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xff170658),
            fontSize: 17,
            fontFamily: "Archivo",
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/Vectores/Iconos/id.svg'),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        "Información general",
                        style: TextStyle(
                          color: Color(0xff170658),
                          fontSize: 13,
                          fontFamily: "Archivo",
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 27.0, left: 15, right: 15),
                child: Container(
                  width: size.width,
                  height: 4,
                  padding: EdgeInsets.only(right: size.width * 0.67),
                  decoration: const BoxDecoration(
                      color: Color(0xffeae4fc),
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 94,
                    ),
                    child: Container(
                        width: 94,
                        height: 4,
                        padding: const EdgeInsets.only(right: 251),
                        decoration: const BoxDecoration(
                            color: Color(0xff170658),
                            borderRadius:
                                BorderRadius.all(Radius.circular(3)))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Form(
                  key: _formKey11,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          "Nacionalidad",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: SizedBox(
                          child: CountryListPick(
                              appBar: AppBar(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                title: const Text(
                                  'Selecciona tu país',
                                  style: TextStyle(
                                    color: Color(0xff170658),
                                    fontSize: 17,
                                    fontFamily: "Archivo",
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                centerTitle: true,
                                leadingWidth: size.width * (44 / size.width),
                                leading: Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * (16 / size.width)),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/Vectores/Iconos/Arrow left.svg',
                                    ),
                                  ),
                                ),
                              ),
                              pickerBuilder:
                                  (context, CountryCode? countryCode) {
                                return Container(
                                  height: 58,
                                  width: size.width,
                                  padding: EdgeInsets.only(
                                    top: size.height * (11 / size.height),
                                    right: size.width * (6 / size.width),
                                    bottom: size.height * (10 / size.height),
                                    left: size.width * (7 / size.width),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xffcdccd1),
                                      width: 1,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        countryCode!.name!,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontFamily: "Archivo",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset(0, 3),
                                                blurRadius: 6,
                                              ),
                                            ],
                                          ),
                                          child: Image.asset(
                                            countryCode.flagUri!,
                                            package: 'country_list_pick',
                                            width:
                                                size.width * (24 / size.width),
                                            height: size.height *
                                                (24 / size.height),
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container()),
                                      SvgPicture.asset(
                                          'assets/Vectores/Iconos/dwon chevron.svg',
                                          width: 24),
                                    ],
                                  ),
                                );
                              },
                              theme: CountryTheme(
                                  isShowFlag: true,
                                  isShowTitle: false,
                                  isShowCode: false,
                                  isDownIcon: true,
                                  showEnglishName: false,
                                  labelColor: const Color(0xff170658),
                                  searchText: 'Buscar',
                                  searchHintText: 'Buscar país',
                                  lastPickText: 'Ultima selección'),
                              // Set default value
                              initialSelection: isoCountryCode,
                              // or
                              // initialSelection: 'US'
                              onChanged: (CountryCode? countryCode) {
                                print(countryCode.toString());
                              },
                              // Whether to allow the widget to set a custom UI overlay
                              useUiOverlay: true,
                              // Whether the country list should be wrapped in a SafeArea
                              useSafeArea: false),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 16, left: 15.0),
                        child: Text(
                          "Nombres",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 15.0, right: 15),
                        child: TextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 15.0,
                        ),
                        child: Text(
                          "Apellidos",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 15.0, right: 15),
                        child: TextFormField(
                          controller: lastNameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 15.0,
                        ),
                        child: Text(
                          "Fecha de nacimiento",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 15.0, right: 15),
                        child: GestureDetector(
                          child: Container(
                            width: size.width,
                            height: 58,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: const Color(0xffCDCCD1),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  formattedDate,
                                  style: const TextStyle(
                                    color: Color(0xff383346),
                                    fontSize: 14,
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                SvgPicture.asset(
                                  'assets/Vectores/Iconos/dwon chevron.svg',
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: SizedBox(
                                    height: 250,
                                    child: ScrollDatePicker(
                                      selectedDate: _selectedDate,
                                      locale: const Locale('es'),
                                      onDateTimeChanged: (DateTime value) {
                                        setState(() {
                                          _selectedDate = value;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 15.0,
                        ),
                        child: Text(
                          "Número documento identidad",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 15.0, right: 15),
                        child: TextFormField(
                          controller: idNumberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xffCDCCD1)),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 15.0,
                        ),
                        child: Text(
                          "Número de teléfono",
                          style: TextStyle(
                            color: Color(0xff170658),
                            fontSize: 13,
                            fontFamily: "Archivo",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 15.0, right: 15),
                        child: IntlPhoneField(
                          flagsButtonPadding:
                              const EdgeInsets.only(left: 15.0, right: 15),
                          showDropdownIcon: false,
                          disableLengthCheck: true,
                          decoration: InputDecoration(
                            suffixIconConstraints:
                                const BoxConstraints(maxWidth: 44),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(end: 15),
                              child: SvgPicture.asset(
                                'assets/Vectores/Iconos/dwon chevron.svg',
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                          initialCountryCode: isoCountryCode,
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, left: 15.0, right: 15, bottom: 34),
                        child: ButtonPrimary(
                            title: 'Continuar',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AddressScreen.routeName);
                            },
                            load: isLoadLogin!,
                            disabled: isLoadLogin!),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
