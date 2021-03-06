import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverytap_admin/AppTheme.dart';
import 'package:deliverytap_admin/services/ItemsService.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:deliverytap_admin/screens/SplashScreen.dart';
import 'package:deliverytap_admin/services/AuthService.dart';
import 'package:deliverytap_admin/services/UserService.dart';
import 'package:deliverytap_admin/services/StoreService.dart';
import 'package:deliverytap_admin/services/CategoryService.dart';
import 'package:deliverytap_admin/services/OrderService.dart';
import 'package:deliverytap_admin/utils/Constants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:url_strategy/url_strategy.dart';

import 'store/AppStore.dart';


AppStore appStore = AppStore();
FirebaseFirestore db = FirebaseFirestore.instance;

AuthService service = AuthService();
UserService userService = UserService();
StoreService storeService = StoreService();
CategoryService categoryService = CategoryService();
OrderService orderService = OrderService();
ItemsService itemsService = ItemsService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  defaultSpreadRadius = 3;


  await Firebase.initializeApp();
  await initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: mAppName,
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: SplashScreen(),
      ),
    );
  }
}
