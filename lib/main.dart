import 'package:flutter/material.dart';
import 'view/dashboard.dart';
import 'view/transaction_list.dart';
import 'view/transaction_detail.dart';

void main() {
  runApp(const KosCashApp());
}

class KosCashApp extends StatelessWidget {
  const KosCashApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KosCash',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardPage(),
        '/transactions': (context) => const TransactionListPage(),
        '/detail': (context) => const TransactionDetailPage(),
      },
    );
  }
}