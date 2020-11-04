import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ora_app/Providers/Cart_Provider.dart';
import 'package:ora_app/Providers/add_address_provider.dart';
import 'package:ora_app/Providers/categories_provider.dart';
import 'package:ora_app/Providers/change_password_provider.dart';
import 'package:ora_app/Providers/citiesProvider.dart';
import 'package:ora_app/Providers/countries_providers.dart';
import 'package:ora_app/Providers/diameters_provider.dart';
import 'package:ora_app/Providers/dias_info_provider.dart';
import 'package:ora_app/Providers/endo_cats_provider.dart';
import 'package:ora_app/Providers/endo_products_provider.dart';
import 'package:ora_app/Providers/get_subCats_provider.dart';
import 'package:ora_app/Providers/implants_provider.dart';
import 'package:ora_app/Providers/login_provider.dart';
import 'package:ora_app/Providers/profile_provider.dart';
import 'package:ora_app/Providers/pros_cat_provider.dart';
import 'package:ora_app/Providers/pros_data_provider.dart';
import 'package:ora_app/Providers/register_provider.dart';
import 'package:ora_app/Util/session_manager.dart';
import 'package:ora_app/bottom_navigation_bar.dart';
import 'package:ora_app/cart.dart';
import 'package:ora_app/catalogue.dart';
import 'package:ora_app/endo/endo_home.dart';
import 'package:ora_app/events_and_educations.dart';
import 'package:ora_app/existing_cards.dart';
import 'package:ora_app/landingPage/Splash_two.dart';

import 'package:ora_app/landingPage/splash_one.dart';
import 'package:ora_app/list_products/Products_list.dart';

import 'package:ora_app/products.dart';
import 'package:ora_app/profile.dart';
import 'package:ora_app/prosthetic/prosthetic_screen.dart';
import 'package:ora_app/register/sign_up.dart';
import 'package:ora_app/search/model/search/search_model.dart';
import 'package:ora_app/sign_in.dart';
import 'address/add_add'
    'ress.dart';

import 'package:ora_app/sub_categries_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contact_us/contact_us.dart';
import 'endo_systems/endo_systems.dart';
import 'home_page.dart';
import 'landingPage/landing_page.dart';
import 'my_orders/my_orders.dart';

Future<void> main() async {

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xFF000000)));
  WidgetsFlutterBinding.ensureInitialized();
  LogInProvider mainProvider = new LogInProvider();
  SessionManager sessionManager = SessionManager();
  SharedPreferences sp = await SharedPreferences.getInstance();
  bool value = sp.getBool("FIRST");
  if (value == null) {
    value = true;
  }

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LogInProvider>(create: (_) => LogInProvider()),
      ChangeNotifierProvider<RegisterProvider>(create: (_) => RegisterProvider()),
      ChangeNotifierProvider<CountryProvider>(create: (_) => CountryProvider()),
      ChangeNotifierProvider<CitiesProvider>(create: (_) => CitiesProvider()),
      ChangeNotifierProvider<ChangePasswordProvider>(
          create: (_) => ChangePasswordProvider()),
      ChangeNotifierProvider<SubCategoryProvider>(
          create: (context) => SubCategoryProvider()),
      ChangeNotifierProvider<CategoriesProvider>(
          create: (context) => CategoriesProvider()),
      ChangeNotifierProvider<CartProvider>(create: (context) => CartProvider()),
      ChangeNotifierProvider<ImplantProvider>(create: (_) => ImplantProvider()),
      ChangeNotifierProvider<DiametersProvider>(create: (_) => DiametersProvider()),
      ChangeNotifierProvider<DiasInfoProvider>(create: (_) => DiasInfoProvider()),
      ChangeNotifierProvider<ProfileProvider>(create: (_) => ProfileProvider()),
      ChangeNotifierProvider<ProsProvider>(create: (_) => ProsProvider()),
      ChangeNotifierProvider<ProsDataProvider>(create: (_) => ProsDataProvider()),
      ChangeNotifierProvider<AddAddressProvider>(create: (_) => AddAddressProvider()),
      ChangeNotifierProvider<EndoProductsProvider>(create: (_) => EndoProductsProvider()),
      ChangeNotifierProvider<EndoCatsProvider>(create: (_) => EndoCatsProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF000000),
        accentColor: Colors.white,
        cardColor: Color(0xFF000000),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => value ? LandingPage() : BottomBar(),
        '/splash': (context) => SecondSplash(),
        '/Home': (context) => BottomBar(),
        '/PROFILE': (context) => Profile(),
        '/IMPLANTS': (context) => SubCategories(),
        '/PROSTHETIC': (context) => Prosthetic(),
        '/EVENTS & EDUCATIONS': (context) => EventsAndEducations(),
        '/CATALOGUE': (context) => Catalogue(),
        '/0': (context) => BottomBar(),
        '/1': (context) => MyCart(),
        '/2': (context) => Profile(),
        '/MY ORDERS': (context) => MyOrders(),
        '/Login | Register': (context) => SignIn(),
        '/reg': (BuildContext context) => SignUp(),
        '/address': (BuildContext context) => AddressScreen(),
        '/existing-cards': (BuildContext context) => ExistingCardsPage(),
        '/sub-categories': (BuildContext context) => SubCategories(),
        '/CONTACT US': (BuildContext context) => ContactUs(),
        '/ENDO SYSTEM': (BuildContext context) => EndoHome(),
        '/products_list': (BuildContext context) => ProductList(),
      },
    ),
  ));
}
