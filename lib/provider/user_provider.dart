
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kursach/enums/storage_keys.dart';
import 'package:kursach/model/user_info.dart';
import 'package:kursach/provider/api_provider.dart';
import 'package:dio/dio.dart';
import 'package:kursach/provider/storage_provider.dart';

class UserProvider extends ChangeNotifier {
  final StorageProvider storageProvider  = StorageProvider();
  final ApiProvider apiProvider = ApiProvider();
  UserInfo? userInfo;
  String? error;

  Future<void> login(
      {required String phoneNumber, required String password}) async {
    error = null;
    try {
      final token = await apiProvider.login(phoneNumber: phoneNumber, password: password);
      await storageProvider.write(StorageKeys.token, token);
    } on DioError catch (error) {
      this.error = error.response?.data['error'];
    }

  }

  Future<void> singUp({required String phoneNumber,
    required String firstName,
    required String lastName,
    required String password}) async {
    error = null;
    try {
     final token =  await apiProvider.singUp(phoneNumber: phoneNumber,
          firstName: firstName,
          lastName: lastName,
          password: password);
     await storageProvider.write(StorageKeys.token, token);
    } on DioError catch (error) {
      this.error = error.response?.data['error'];
    }
  }
  Future<void> userinfo () async {
    userInfo = await apiProvider.userInfo();
    notifyListeners();
  }
  Future<void> infoaccounts() async {
    final infoaccounts = await apiProvider.infoaccounts();
    notifyListeners();
  }


}
