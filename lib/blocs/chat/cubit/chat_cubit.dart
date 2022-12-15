import 'package:bloc/bloc.dart';
import 'package:chatapp/models/massages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  static ChatCubit get(context) => BlocProvider.of(context);

  TextEditingController massageController = TextEditingController();
  Stream? massageStream;

  sendMassage(time) {
    emit(ChatMassageSenderLoding());
    String UserEmail = FirebaseAuth.instance.currentUser!.email!;
    Massage massage =
        Massage(text: massageController.text, sender: UserEmail, now: time);
    FirebaseFirestore.instance
        .collection('massages')
        .add(massage.tomap())
        .then((value) {
      emit(ChatMassageSenderSuccess());
    }).catchError((e) {
      emit(ChatMassageSenderError());
      print(e);
    });
  }

  getMassage() {
    massageStream =FirebaseFirestore.instance.collection('massages').orderBy('time').snapshots();
  emit(ChatReceiveMassage());
  }
}
