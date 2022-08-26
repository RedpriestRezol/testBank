
import 'package:flutter/material.dart';
import 'package:kursach/enums/storage_keys.dart';
import 'package:kursach/my_app.dart';
import 'provider/storage_provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = await StorageProvider().read(StorageKeys.token);
  runApp(MyApp(logetin: token != null));
}



