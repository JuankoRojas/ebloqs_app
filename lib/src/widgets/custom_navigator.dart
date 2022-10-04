part of 'custom_widgets.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator>
    with AfterLayoutMixin<CustomNavigator> {
  bool isLoading = false;
  Environment? environment;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    setState(() {
      environment = AppConfig.of(context).environment;
    });
  }

  @override
  Widget build(BuildContext context) {
    String? currentPath = ModalRoute.of(context)!.settings.name;
    print('currentPath: $currentPath');
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        padding: EdgeInsets.only(
            top: size.height * (10 / size.height),
            bottom: size.height * (18 / size.height),
            left: size.width * (13 / size.width),
            right: size.width * (13 / size.width)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///creación del botón de navegacion a ofertas
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      icon: SvgPicture.asset(
                        'assets/Vectores/Iconos/home.svg',
                        color: (currentPath == 'HomeScreen')
                            ? const Color(0xff2504CA)
                            : const Color(0xff170658),
                      )),
                  Text(
                    'Principal',
                    style: TextStyle(
                        color: (currentPath == 'HomeScreen')
                            ? const Color(0xff2504CA)
                            : const Color(0xff170658),
                        fontSize: 10,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            ///creación del botón de navegacion a mercado
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        (environment == Environment.prod)
                            ? customModalBottomAlert(
                                context,
                                size,
                                'La opción de inversiones se habilitará en la etapa 2.',
                                isLoading,
                                '', () {
                                Navigator.pop(context);
                              })
                            : customModalBottomAlert(
                                context,
                                size,
                                'No tienes inversiones por el momento, puedes ir a tu billetera y comprar tokens de utilidad ebloqs (EBL).',
                                isLoading,
                                '', () {
                                Navigator.pop(context);
                              });
                      },
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/inversiones.svg')),
                  const Text(
                    'Inversiones',
                    style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 10,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            ///creación del botón de navegacion a portafolio
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () async {
                        final idWallet = Preferences.id_wallet;
                        final publicKey = Preferences.public_key;

                        if (idWallet != null && publicKey != null) {
                          Navigator.pushNamed(context, WalletScreen.routeName);
                        } else {
                          (environment == Environment.prod)
                              ? customModalBottomAlert(
                                  context,
                                  size,
                                  '"La opción de billetera se habilitará en la etapa 2.',
                                  isLoading,
                                  '', () {
                                  Navigator.pop(context);
                                })
                              : Navigator.pushNamed(
                                  context, NationalityScreen.routeName);
                        }
                      },
                      icon: SvgPicture.asset(
                        'assets/Vectores/Iconos/wallet.svg',
                        color: (currentPath == 'WalletScreen')
                            ? const Color(0xff2504CA)
                            : const Color(0xff170658),
                      )),
                  Text(
                    'Billetera',
                    style: TextStyle(
                        color: (currentPath == 'WalletScreen')
                            ? const Color(0xff2504CA)
                            : const Color(0xff170658),
                        fontSize: 10,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            ///creación del botón de navegacion a perfil
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pushNamed(context, MarketScreen.routeName);
                    },
                    icon: SvgPicture.asset('assets/Vectores/Iconos/mercado.svg',
                        color: (currentPath == 'MarketScreen')
                            ? const Color(0xff2504CA)
                            : const Color(0xff170658)),
                  ),
                  Text(
                    'Mercado',
                    style: TextStyle(
                        color: (currentPath == 'MarketScreen')
                            ? const Color(0xff2504CA)
                            : const Color(0xff170658),
                        fontSize: 10,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            ///creación del botón de navegacion a perfil
            GestureDetector(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      visualDensity: VisualDensity.compact,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        customModalBottomAlert(
                            context,
                            size,
                            'La opción de beneficios se habilitará en la etapa 2.',
                            isLoading,
                            '', () {
                          Navigator.pop(context);
                        });
                        // Navigator.pushNamed(context, BenefitsScreen.routeName);
                      },
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/referidos(2).svg')),
                  const Text(
                    'Beneficios',
                    style: TextStyle(
                        color: Color(0xff170658),
                        fontSize: 10,
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
