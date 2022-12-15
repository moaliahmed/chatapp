import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.name,required this.function});
  String name;
  Function function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.red.withOpacity(.6))),
        onPressed: (){function();},
        child: Text(
          name,
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
