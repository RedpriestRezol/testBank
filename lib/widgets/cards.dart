import 'package:flutter/material.dart';
import 'package:kursach/provider/cards_provider.dart';
import 'package:kursach/provider/user_provider.dart';
import 'package:kursach/screens/send_screen.dart';
import 'package:provider/provider.dart';

class MyCard extends StatefulWidget {
  double balance;
  String currency;
  String number;
  MyCard({
    required this.balance,
    required this.currency,
    required this.number,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  sendmoney() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SendScreen(currency: widget.currency, number: widget.number, balance: widget.balance,)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color(0xffd8e2ea)),
            borderRadius: BorderRadius.circular(24),
            color: Color(0xffFFFFFF),
            boxShadow: const [
              BoxShadow(blurRadius: 48,
                  color: Color.fromRGBO(44, 39, 56, 0.02),
                  offset: Offset(0, 24)),
              BoxShadow(blurRadius: 24,
                  color: Color.fromRGBO(4, 39, 56, 0.04),
                  offset: Offset(0, 14)),
            ]),
        height: 251,
        width: 339,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: Stack(
                children: [
                  Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Image.asset('assets/images/Image.png'))),
                  Positioned(
                    top: 50,
                    left: 93,
                    child: Text(
                      '${widget.balance} ${widget.currency}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 28,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    left: 105,
                    child: Text(
                      '${widget.number}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 34.0, top: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xffFFFFFF)),
                ),
                onPressed: sendmoney,
                child: Container(
                  child: const Text(
                    'Перевести',
                    style: TextStyle(color: Color(0xff7C9CBF)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
