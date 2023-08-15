import 'package:flutter/material.dart';
class MyTransactions extends StatelessWidget {
  final String transactionName;
  final String money;
  final String incomeOrExpense;
   MyTransactions ( {
   required this.transactionName,
     required this.money  ,
     required this.incomeOrExpense });


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: EdgeInsets.all(10),
          height: 55,
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle , color: Colors.grey[500],

                    ),
                    child: Center(
                      child: Icon(Icons.attach_money_outlined , color: Colors.white,),
                    ),
                  ),
                  SizedBox( width: 7,),
                  Text(transactionName , style: TextStyle(
                    fontSize: 17, color: Colors.grey[500],
                  ), ),
                ],
              ),
              Text( (incomeOrExpense == 'income'? '+': '-') + '\$' +money , style: TextStyle(
                color: (incomeOrExpense == 'income'? Colors.green: Colors.red),
                fontSize: 17,fontWeight: FontWeight.bold,
              ),),
            ],
          )),
    );
  }
}
