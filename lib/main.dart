import 'package:flutter/material.dart';
//import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'components/onboarding_screen.dart';
import 'data/expense_data.dart';
import 'homePage.dart';
//import 'package:hive/hive.dart';

void main()  {
  // initiakize the hive database
  // await Hive.initFlutter();
  // await Hive.openBox("expense_database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Onboarding(),
      ),
    );
  }
}
