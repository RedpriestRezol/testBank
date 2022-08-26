class Accounts {
  final double balance;
  final String currency;
  final String number;
  Accounts.fromJason({required Map<String, dynamic> jason})
      : balance = jason['balance'] + 0.0,
        currency = jason['currency'],
        number = jason['number'];
}
