import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController loginusernamecontroller = TextEditingController();
  TextEditingController loginpasswordcontroller = TextEditingController();
  TextEditingController registerusernamecontroller = TextEditingController();
  TextEditingController registerpasswordcontroller = TextEditingController();

  register() {
    emit(authRegisterLoding());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: registerusernamecontroller.text,
            password: registerpasswordcontroller.text )
        .then((value) {
      emit(authRegisterSucess());
    }).catchError((e) {
      emit(authRegisterError());
      print('Error$e');
    });
  }

  login() {
    emit(authLoginLoding());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: loginusernamecontroller.text,
            password: loginpasswordcontroller.text)
        .then((value) {
      emit(authLoginSucess());
    }).catchError((e) {
      emit(authLoginError());
      print('Error$e');
    });
  }
logout(){
   FirebaseAuth.instance.signOut();
}
}
