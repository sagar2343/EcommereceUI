import 'package:first_project/core/store.dart';
import 'package:first_project/pages/cart_page.dart';
import 'package:first_project/pages/home.dart';
import 'package:first_project/pages/login_page.dart';
import 'package:first_project/pages/register_page.dart';
import 'package:first_project/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'utils/widgets/themes.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
        MyRoutes.registerRoute: (context) => RegisterPage(),

      },
    );
  }
}
