part of 'custom_widgets.dart';

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? currentPath = ModalRoute.of(context)!.settings.name;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        padding:
            const EdgeInsets.only(top: 10, bottom: 18, left: 13, right: 13),
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
                      onPressed: () {},
                      icon:
                          SvgPicture.asset('assets/Vectores/Iconos/home.svg')),
                  const Text(
                    'Principal',
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
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/inversiones.svg')),
                  const Text(
                    'Inversiones',
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
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/wallet.svg')),
                  const Text(
                    'Billetera',
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
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/mercado.svg')),
                  const Text(
                    'Mercado',
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
                      onPressed: () {},
                      icon: SvgPicture.asset(
                          'assets/Vectores/Iconos/referidos(2).svg')),
                  const Text(
                    'Referidos',
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
