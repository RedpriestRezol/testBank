import 'package:flutter/cupertino.dart';
import 'package:kursach/model/currency_accunt.dart';
import 'package:kursach/provider/api_provider.dart';

class AccountsProvider extends ChangeNotifier{
   List<CurrencyAccount> accounts =[];
  final ApiProvider apiProvider = ApiProvider();
  Future<void> getAccounts () async{
     accounts = await apiProvider.availableaccounts();
     notifyListeners();
  }
   Future<void> createNewAcc({
     required String currency,
   }) async  {
    await apiProvider.createNewAcc(currency: currency);
    getAccounts();
   }

}