import 'package:flutter/material.dart';
import 'package:kursach/provider/cards_provider.dart';
import 'package:kursach/provider/user_provider.dart';
import 'package:kursach/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'screens/user_acc_screen.dart';

class MyApp extends StatefulWidget {
  final bool logetin;
  const MyApp({
    Key? key,
    required this.logetin,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            final UserProvider userprovider = UserProvider();
            if (widget.logetin == true) {
              userprovider.userinfo();
            }
            return userprovider;
          },
        ),
        ChangeNotifierProvider(
          create: (context) => CardsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget.logetin ? UserAccScreen() : LoginScreen(),
      ),
    );
  }
}
