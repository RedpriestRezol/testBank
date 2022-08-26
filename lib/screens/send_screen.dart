import 'package:flutter/material.dart';
import 'package:kursach/provider/cards_provider.dart';
import 'package:kursach/widgets/currency.dart';
import 'package:kursach/widgets/my_text_input.dart';
import 'package:kursach/widgets/user_icon.dart';
import 'package:provider/provider.dart';

class SendScreen extends StatefulWidget {
  const SendScreen({Key? key, required this.balance, required this.currency,required this.number}) : super(key: key);
  final double balance;
  final String currency;
  final String number;


  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
  final _controllernumber = TextEditingController();
  final _controllersum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
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
                child: UserIcon(),
          ),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(
                height: 57,
              ),
              Text('${widget.number}', style:  TextStyle(
                color: Color(0xff000000),
                fontSize: 18,
                fontWeight: FontWeight.w600,

              ),),
              SizedBox(
                height: 30,
              ),
              Text('${widget.balance} ${widget.currency}',style: TextStyle(
                color: Color(0xff000000),
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(
                height: 30,
              ),
              MyTextInput(
                controller: _controllernumber,
                placeholder: '+375XXXXXXXXX',
                label: 'Номер получателя',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextInput(controller: _controllersum,label: 'сумма', placeholder: '1.00'),
              SizedBox(height: 180,),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xff0880AE)),
                ),
                onPressed: () {context.read<CardsProvider>().sendmoney(double.parse(_controllersum.text), widget.currency, _controllernumber.text);},
                child: Container(
                    width: double.infinity,
                    child: Center(
                        child: Text(
                          'Отправить',
                          style: TextStyle(color: Color(0xffEBF4F8)),
                        ))),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
