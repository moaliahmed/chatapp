import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyTextFiled extends StatelessWidget {
   MyTextFiled({super.key,required this.label, this.isPassword=false,required this.controller} );
 String label ;
 var controller;
 bool isPassword ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter your $label',
                          border: OutlineInputBorder(), labelText: label),
                          obscureText: isPassword,
                          controller:controller ,
                          
                    ),
    );
  }
}