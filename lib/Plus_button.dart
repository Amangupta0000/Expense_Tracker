import 'package:flutter/material.dart';
class PlusButton extends StatelessWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text('+', style: TextStyle(
          color: Colors.white, fontSize: 25,
        ),),
      ),
    );
  }
}
