import 'package:flutter/material.dart';
import 'package:kursach/provider/user_provider.dart';
import 'package:kursach/widgets/my_text_input.dart';
import 'user_acc_screen.dart';
import 'package:provider/provider.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  final _numbController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordController = TextEditingController();
  singup() async {
    final provide = context.read<UserProvider>();
    await provide.singUp(
        phoneNumber: _numbController.text,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        password: _passwordController.text);
    if (provide.error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(provide.error!)));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserAccScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 21,
              ),
              SizedBox(
                child: Image.asset('assets/images/credit-card 1.png'),
                height: 64,
                width: 64,
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Регистрация',
                style: TextStyle(
                  color: Color(0xff756f86),
                  fontFamily: 'IBM Plex Sans',
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 67),
              MyTextInput(keyboardType: TextInputType.phone,
                  controller: _numbController,
                  label: 'Номер',
                  obscureText: false,
                  placeholder: '+37529XXXXXXX'),
              SizedBox(height: 62),
              MyTextInput(
                  controller: _firstNameController,
                  label: 'Имя',
                  obscureText: false,
                  placeholder: 'Введите Ваше имя'),
              SizedBox(height: 62),
              MyTextInput(
                  controller: _lastNameController,
                  label: 'Фамилия',
                  obscureText: false,
                  placeholder: 'Введите Вашу фамилию'),
              SizedBox(height: 54),
              MyTextInput(
                  controller: _passwordController,
                  label: 'Пароль',
                  obscureText: true,
                  placeholder: 'Введите пароль'),
              SizedBox(height: 102),
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
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
                      onPressed: singup,
                      child: Container(
                          width: double.infinity,
                          child: Center(child: Text('Зарегистрироваться'))),
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
                      onPressed: () {},
                      child: Container(
                        width: double.infinity,
                        child: Center(
                          child: Text(
                            'Вход',
                            style: TextStyle(color: Color(0xff7C9CBF)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
