import 'package:flutter/material.dart';
import 'package:kursach/widgets/cards.dart';


class UserCards extends StatelessWidget {
  const UserCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Аккаунт',
              style: TextStyle(
                color: Color(0xff756F86),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: 'IBM Plex Sans',
              ),
            ),
          ),
          backgroundColor: const Color(0xffffffff),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xff7C9CBF),
                    ),
                    child: Center(child: Text('XX'))))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0),
              child: Column(
                children: [
                  SizedBox(height: 17),

                  SizedBox(height: 34),

                  SizedBox(height: 34),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff0880AE)),
                      ),
                      onPressed: () {},
                      child: Container(
                          child: const Text(
                        'Добавить',
                        style: TextStyle(color: Color(0xffEBF4F8)),
                      ))),
                  SizedBox(height: 34),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: double.infinity,
                      child: const Center(
                        child: Text(
                          'Обновить',
                          style: TextStyle(color: Color(0xff7C9CBF)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
