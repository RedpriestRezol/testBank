import 'package:flutter/material.dart';

class Currency extends StatelessWidget {
  final String text1;
  final String text2;
  final bool added;
  final void Function()? add;

  const Currency({
    required this.text1,
    required this.text2,
    required  this.added,
    required this.add,
  });


  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(
      color: Color(0xffFFFFFF),
    ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$text1',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff2C2738),
                  ),
                ),
                if (added) SizedBox(height: 30, width: 30, child: Icon(Icons.check))
              ],
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              '$text2',
              style: TextStyle(
                color: Color(0xff2C2738),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 13,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xffFFFFFF)),
              ),
              onPressed: add,
              child: Container(
                height: 48,
                width: 140,
                child: Center(
                  child: Text(
                    'Создать',
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
