import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final letter;
  final function;

  MyButton({this.letter, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: const Color.fromARGB(255, 255, 179, 92),
          width: 50,
          height: 50,
          child: Center(
            child: DefaultTextStyle(
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),
              child: Text(letter),
            ),
          ),
        ),
      ),
    );
  }
}
