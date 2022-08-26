import 'package:flutter/material.dart';
import 'package:kursach/provider/cards_provider.dart';
import 'package:kursach/screens/send_screen.dart';
import 'package:provider/provider.dart';
import 'package:kursach/screens/checks_screen.dart';
import 'package:kursach/widgets/cards.dart';
import 'package:kursach/widgets/user_icon.dart';

class UserAccScreen extends StatefulWidget {
  const UserAccScreen({Key? key}) : super(key: key);

  @override
  State<UserAccScreen> createState() => _UserAccScreenState();
}

class _UserAccScreenState extends State<UserAccScreen> {
  addAccount() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CheckScreen()));
  }

  @override
  void initState() {
    context.read<CardsProvider>().infoaccounts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        shadowColor: Colors.black.withOpacity(0.16),
        title: Text(
          'Аккаунт',
          style: TextStyle(
            color: Color(0xff756F86),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: 'IBM Plex Sans',
          ),
        ),
        backgroundColor: Color(0xffffffff),
        actions: [
          Padding(padding: const EdgeInsets.all(8.0), child: UserIcon())
        ],
      ),
      body: Center(
        child: Consumer<CardsProvider>(
            builder: (context, provider, child) => Column(
                  children: [
                    ...provider.card.map(
                      (e) => MyCard(
                        balance: e.balance,
                        number: e.number,
                        currency: e.currency,
                      ),
                    )
                  ],
                )),
      ),
    );
  }
}
