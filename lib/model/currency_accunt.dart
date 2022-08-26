class CurrencyAccount {
  String cyrrency;
  String description;
  bool added;

  CurrencyAccount({
    required this.cyrrency,
    required this.description,
    required this.added,
  });
  CurrencyAccount.fromJason(Map<String, dynamic> jason)
      : cyrrency = jason['currency'],
        description = jason['description'],
        added = jason['added'];
}

