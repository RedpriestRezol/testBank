import 'package:flutter/cupertino.dart';
import 'package:kursach/enums/storage_keys.dart';
import 'package:kursach/model/accounts%20.dart';
import 'package:kursach/model/currency_accunt.dart';
import 'package:kursach/model/user_info.dart';
import 'package:kursach/provider/storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:kursach/model/user_info.dart';

class ApiProvider extends ChangeNotifier {
  final StorageProvider storageProvider = StorageProvider();
  late Dio dio;
  final host = 'https://bank-app-kjdfasiuxcvh.herokuapp.com';

  ApiProvider() {
    dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }

  Future<String> login(
      {required String phoneNumber, required String password}) async {
    final response = await dio.post(host + '/login', data: {
      'password': password,
      'phoneNumber': phoneNumber,
    });
    if (response.statusCode == 401) {
      throw Exception(response.data['error']);
    }

    return response.data['token'];
  }

  Future<String> singUp(
      {required String phoneNumber,
      required String firstName,
      required String lastName,
      required String password}) async {
    final response = await dio.post(host + '/signup', data: {
      'phoneNumber': phoneNumber,
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
    });
    return response.data['token'];
  }

  Future<List<CurrencyAccount>> availableaccounts() async {
    final response = await dio.get(host + '/available-accounts',
        options: Options(headers: {
          'authorization':
              'Bearer ${await storageProvider.read(StorageKeys.token)}'
        }));
    return (response.data['accounts'] as List)
        .map((e) => CurrencyAccount.fromJason(e))
        .toList();
  }

  Future<void> createNewAcc({
    required String currency,
  }) async {
    final response = await dio.post(host + '/add-account',
        data: {'currency': currency},
        options: Options(headers: {
          'authorization':
              'Bearer ${await storageProvider.read(StorageKeys.token)}'
        }));
  }

  Future<UserInfo> userInfo() async {
    final response = await dio.get(host + '/me',
        options: Options(headers: {
          'authorization':
              'Bearer ${await storageProvider.read(StorageKeys.token)}'
        }));
    return UserInfo.fromJason(jason: response.data);
  }

  Future<List<Accounts>> infoaccounts() async {
    final response = await dio.get(host + '/accounts',
        options: Options(headers: {
          'authorization':
              'Bearer ${await storageProvider.read(StorageKeys.token)}'
        }));
    return (response.data['accounts'] as List)
        .map((e) => Accounts.fromJason(jason: e))
        .toList();
  }

  Future<void> sendmoney({
    required receiverPhoneNumber,
    required currency,
    required amount,
  }) async {
    final response = await dio.post(host + '/send-money',
        options: Options(headers: {
          'authorization':
              'Bearer ${await storageProvider.read(StorageKeys.token)}'
        }),
        data: {
          'receiverPhoneNumber': receiverPhoneNumber,
          'currency': currency,
          'amount': amount,
        });
  }
}
