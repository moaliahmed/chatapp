import 'package:chatapp/blocs/auth/cubit/login_cubit.dart';
import 'package:chatapp/components/app_logo.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfiled.dart';
import 'package:chatapp/enums/toast_states.dart';
import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/utils/app_navigator.dart';
import 'package:chatapp/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is authRegisterSucess){
          AppNavigator.appNavigator(context, true, ChatScreen());
          ToastConfig.showToast(msg: 'welocom to Applecition', toastStates: ToastStates.Success);
        }
        if (state is authRegisterError){
          ToastConfig.showToast(msg: 'Error', toastStates: ToastStates.Error);
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 50,
              ),
              const Logo(),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Text(
                  'connect with your frinds now',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(.3)),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              MyTextFiled(
              
                label: 'Username',
                controller: cubit.registerusernamecontroller,
              ),
              MyTextFiled(
                isPassword: true,
              
                label: 'Password',
                controller: cubit.registerpasswordcontroller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'you have an account?',
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        AppNavigator.appNavigator(
                            context, false, LoginScreen());
                      },
                      child: Text(
                        'login!',
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              ),
              MyButton(
                function: (){
                  cubit.register();
                  print('hello');
                }
                ,
                name: 'Submit',
              ),

              
              
            ]),
          ),
        );
      },
    );
  }
}
