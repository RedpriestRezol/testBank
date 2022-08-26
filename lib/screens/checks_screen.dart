import 'package:flutter/material.dart';
import 'package:kursach/provider/accounts_provider.dart';
import 'package:kursach/widgets/currency.dart';
import 'package:provider/provider.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountsProvider()..getAccounts(),
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Новый аккаунт',
              style: TextStyle(
                color: Color(0xff756F86),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'IBM Plex Sans',
              ),
            ),
          ),
          backgroundColor: Color(0xffffffff),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xff7C9CBF),
                  ),
                  child: Center(child: Text('XX'))),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Consumer<AccountsProvider>(
            builder: (context, provider, child) => Column(
              children: [
                ...provider.accounts.map((e) => Currency(
                      text1: e.cyrrency,
                      text2: e.description,
                      added: e.added,
                      add: () async => await provider.createNewAcc(currency: e.cyrrency),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
