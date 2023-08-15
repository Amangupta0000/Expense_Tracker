import 'package:expense_tracker/Plus_button.dart';
import 'package:expense_tracker/google_sheets_api.dart';
import 'package:expense_tracker/top_card.dart';
import 'package:expense_tracker/transactions.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TopCard(
              balance: '10,000', income: '50,000', expense: '7,000',
            ),
            Expanded(
                child: ListView.builder(
                  itemCount: GoogleSheetsApi().currentTransaction.length,
                    itemBuilder: ( context , index) {
                  return MyTransactions(
                      incomeOrExpense: GoogleSheetsApi().currentTransaction[index][2],
                      money: GoogleSheetsApi().currentTransaction[index][1],
                      transactionName: GoogleSheetsApi().currentTransaction[index][0]
                  ) ;
                } ,),
            ),
           PlusButton(),
          ],
        ),
      ),
    )
    ;
  }
}
