import 'package:chatapp/appcolors/app_color.dart';
import 'package:chatapp/blocs/auth/cubit/login_cubit.dart';
import 'package:chatapp/blocs/chat/cubit/chat_cubit.dart';
import 'package:chatapp/components/chat_list.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/utils/app_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatelessWidget {
   ChatScreen({super.key});

    

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit,ChatState>( listener: (context, state) {
      
    } ,builder: (context,stats){
      var cubit=ChatCubit.get(context);
      
      return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        actions: [
          IconButton(
              onPressed: () {
                LoginCubit.get(context).logout();
                AppNavigator.appNavigator(context, true, LoginScreen());
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          cubit.massageStream==null?Text('Error'):
            ChatList(massageStream: cubit.massageStream!),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextFormField(
              decoration: InputDecoration(
                
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed:(){
                  DateTime dateTime=DateTime.now();
                  cubit.sendMassage(dateTime);
                  cubit.massageController.clear();
                  } ,icon: Icon(Icons.send),)
      
              ),
              controller: cubit.massageController,
            ),
          )
        ]),
      ),
    );
  });
  }
}
