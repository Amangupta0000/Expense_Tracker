 import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';

class TopCard extends StatelessWidget {
   final  String balance ;
   final  String income ;
   final  String expense ;
  TopCard( { required this.balance , required this.expense , required this.income}) ;
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(4.0),
       child: Container(
          height: 200,
         color: Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('B A L A N C E' , style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),),
              Text( '\$' +balance , style: TextStyle(
                fontSize: 40,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),),
              Padding(
                 padding: const EdgeInsets.symmetric( horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                             padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                                child: Icon(Icons.arrow_upward , color: Colors.green,))),
                        // SizedBox( height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('INCOME',style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                            ),),
                            Text( '\$' + income , style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey[200],
                            ),
                            child: Center(
                                child: Icon(Icons.arrow_downward, color: Colors.red,))),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('EXPENSE' , style: TextStyle(
                              color: Colors.grey[500], fontSize: 15,
                            ),),
                            Text( '\$' +expense , style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
         // decoration: BoxDecoration(
         //   borderRadius: BorderRadius.circular(15),
         //   color: Colors.grey[300],
         //   boxShadow :[
         //     BoxShadow(
         //       color: Colors.grey.shade500,
         //       // offset: Offset( 8.0 , 8.0 ),
         //       // blurRadius: 1.0,
         //       // spreadRadius: 1.0,
         //     ),
         //     BoxShadow(
         //       color: Colors.white,
         //       // offset: Offset( -8.0 , -8.0 ),
         //       // blurRadius: 10.0,
         //       // spreadRadius: 1.0,
         //     ),
         //   ]
         // ),

       ),
     );
   }
 }
 