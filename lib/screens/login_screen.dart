import 'package:flutter/material.dart';
import 'package:kursach/provider/user_provider.dart';
import 'package:kursach/screens/sing_up_screen.dart';
import 'package:kursach/screens/user_acc_screen.dart';
import 'package:kursach/widgets/my_text_input.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _numbController = TextEditingController();
  final _passwordController = TextEditingController();
  login() async {
    final provide = context.read<UserProvider>();
    await provide.login(
        phoneNumber: _numbController.text, password: _passwordController.text);
    if (provide.error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(provide.error!)));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserAccScreen()));
  }
  singup() async {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SingUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(
                height: 76,
              ),
              SizedBox(
                child: Image.asset('assets/images/credit-card 1.png'),
                height: 64,
                width: 64,
              ),
              SizedBox(
                height: 64,
              ),
              Text(
                'Войти',
                style: TextStyle(
                  color: Color(0xff756f86),
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 67),
              MyTextInput(
                  keyboardType: TextInputType.phone,
                  controller: _numbController,
                  label: 'Номер',
                  obscureText: false,
                  placeholder: '+37529XXXXXXX'),
              SizedBox(height: 62),
              MyTextInput(
                  keyboardType: TextInputType.number,
                  controller: _passwordController,
                  label: 'Пароль',
                  obscureText: true,
                  placeholder: 'Введите пароль'),
              SizedBox(height: 209),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(44, 39, 56, 0.08),
                            blurRadius: 4,
                            offset: Offset(0, 2)),
                        BoxShadow(
                            color: Color.fromRGBO(44, 39, 56, 0.08),
                            blurRadius: 8,
                            offset: Offset(0, 4)),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: login,
                      child: Container(
                          width: double.infinity,
                          child: Center(child: Text('Войти'))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(44, 39, 56, 0.0001),
                            blurRadius: 4,
                            offset: Offset(0, 2)),
                        BoxShadow(
                            color: Color.fromRGBO(44, 39, 56, 0.08),
                            blurRadius: 8,
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: singup,
                      child: Container(
                          width: double.infinity,
                          child: const Center(
                              child: Text(
                            'Регистрация',
                            style: TextStyle(color: Color(0xff7C9CBF)),
                          ))),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
