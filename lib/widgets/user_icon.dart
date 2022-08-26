import 'package:flutter/material.dart';
import 'package:kursach/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder:(context, value, child) =>  Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color(0xff7C9CBF),
          ),
          child: Center(child: value.userInfo != null ? Text('${value.userInfo?.firstName[0]}${value.userInfo?.lastName[0]}') : Text(''))),
    );
  }
}
