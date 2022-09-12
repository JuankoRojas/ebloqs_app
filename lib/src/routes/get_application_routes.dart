import 'package:ebloqs_app/src/screens/buy/comprar_screen.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_tarjeta_screen.dart';
import 'package:ebloqs_app/src/screens/buy/introducir_cantidad_transferencia_screen.dart';
import 'package:ebloqs_app/src/screens/buy/transferir_ebloqs_screen.dart';
import 'package:ebloqs_app/src/screens/deposit/deposit_methods_screen.dart';
import 'package:ebloqs_app/src/screens/deposit/deposit_screen.dart';
import 'package:ebloqs_app/src/screens/home_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/address_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/id_document_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/personal_information_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/take_picture_back_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/take_picture_front_passport_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/take_picture_front_screen.dart';
import 'package:ebloqs_app/src/screens/indentity/upload_document_screen.dart';
import 'package:ebloqs_app/src/screens/legal/privacy_policy_screen.dart';
import 'package:ebloqs_app/src/screens/legal/therms_conditions_screen.dart';
import 'package:ebloqs_app/src/screens/local_auth/local_auth-Android.dart';
import 'package:ebloqs_app/src/screens/local_auth/local_auth.dart';
import 'package:ebloqs_app/src/screens/indentity/nationality_screen.dart';
import 'package:ebloqs_app/src/screens/market/market_screen.dart';
import 'package:ebloqs_app/src/screens/onBoard/on_board_screen_route.dart';
import 'package:ebloqs_app/src/screens/project/project_view_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_correo_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_link_screen.dart';
import 'package:ebloqs_app/src/screens/register/registro_redes_screen.dart';
import 'package:ebloqs_app/src/screens/settings/add_card_screen.dart';
import 'package:ebloqs_app/src/screens/settings/avatar_selection_screen.dart';
import 'package:ebloqs_app/src/screens/settings/payments_methods_screen.dart';
import 'package:ebloqs_app/src/screens/settings/personal_information_screen.dart';
import 'package:ebloqs_app/src/screens/settings/personal_settings.dart';
import 'package:ebloqs_app/src/screens/settings/settings_screen.dart';
import 'package:ebloqs_app/src/screens/transfer/transfer_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_pass_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/create_wallet_screen.dart';
import 'package:ebloqs_app/src/screens/wallet/wallet_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    OnBoardPageRoute.routeName: (BuildContext context) =>
        const OnBoardPageRoute(),
    RegistroRedesScreen.routeName: (BuildContext context) =>
        const RegistroRedesScreen(),
    RegistroCorreoScreen.routeName: (BuildContext context) =>
        const RegistroCorreoScreen(),
    RegistroLinkScreen.routeName: (BuildContext context) =>
        const RegistroLinkScreen(),
    CreateWalletScreen.routeName: (BuildContext context) =>
        const CreateWalletScreen(),
    CreateWalletPassScreen.routeName: (BuildContext context) =>
        const CreateWalletPassScreen(),
    ComprarScreen.routeName: (BuildContext context) => const ComprarScreen(),
    IntroducirCantidadTransferenciaScreen.routeName: (BuildContext context) =>
        const IntroducirCantidadTransferenciaScreen(),
    IntroducirCantidadTarjetaScreen.routeName: (BuildContext context) =>
        const IntroducirCantidadTarjetaScreen(),
    TransferirEbloqsScreen.routeName: (BuildContext context) =>
        const TransferirEbloqsScreen(),
    WalletScreen.routeName: (BuildContext context) => const WalletScreen(),
    ProjectViewScreen.routeName: (BuildContext context) =>
        const ProjectViewScreen(),

    NationalityScreen.routeName: (BuildContext context) =>
        const NationalityScreen(),
    PersonalInformation.routeName: (BuildContext context) =>
        const PersonalInformation(),
    AddressScreen.routeName: (BuildContext context) => const AddressScreen(),
    IdDocumentScreen.routeName: (BuildContext context) =>
        const IdDocumentScreen(),
    TakePictureFront.routeName: (BuildContext context) =>
        const TakePictureFront(),
    TakePictureBack.routeName: (BuildContext context) =>
        const TakePictureBack(),
    // CongratsScreen.routeName: (BuildContext context) => const CongratsScreen(),
    DepositScreen.routeName: (BuildContext context) => const DepositScreen(),
    DepositMethodsScreen.routeName: (BuildContext context) =>
        const DepositMethodsScreen(),
    TransferScreen.routeName: (BuildContext context) => const TransferScreen(),
    UploadDocumentScreen.routeName: (BuildContext context) =>
        const UploadDocumentScreen(),

    //Market
    MarketScreen.routeName: (BuildContext context) => const MarketScreen(),
    //passport
    TakePicturePassportFront.routeName: (BuildContext context) =>
        const TakePicturePassportFront(),

    //localAuth
    LocalAuth.routeName: (BuildContext context) => const LocalAuth(),
    LocalAuthAndroid.routeName: (BuildContext context) =>
        const LocalAuthAndroid(),
    //Legal

    ThermsConditionsScreen.routeName: (BuildContext context) =>
        const ThermsConditionsScreen(),

    PrivacyPolicyScreen.routeName: (BuildContext context) =>
        const PrivacyPolicyScreen(),

    //Settings
    SettingsScreen.routeName: (BuildContext context) => const SettingsScreen(),
    AvatarSelectionScreen.routeName: (BuildContext context) =>
        const AvatarSelectionScreen(),
    PaymentMethodsScreen.routeName: (BuildContext context) =>
        const PaymentMethodsScreen(),
    AddCardAcreen.routeName: (BuildContext context) => const AddCardAcreen(),
    PersonalSettingsScreen.routeName: (BuildContext context) =>
        const PersonalSettingsScreen(),
    PersonalInformationScreen.routeName: (BuildContext context) =>
        const PersonalInformationScreen(),
  };
}
