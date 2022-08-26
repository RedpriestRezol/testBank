import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:kursach/model/accounts%20.dart';
import 'package:kursach/model/currency_accunt.dart';
import 'package:kursach/provider/api_provider.dart';

class CardsProvider extends ChangeNotifier {
  List<Accounts> card = [];
  final ApiProvider apiProvider = ApiProvider();
  Future<void> infoaccounts() async {
    card = (await apiProvider.infoaccounts()) as List<Accounts>;
    notifyListeners();
  }

  Future<void> sendmoney(
    final double amount,
    final String currency,
    final String receiverPhoneNumber,
  ) async {
    await apiProvider.sendmoney(
      currency: currency,
      amount: amount,
      receiverPhoneNumber: receiverPhoneNumber,
    );
    notifyListeners();
    infoaccounts();
  }
}
