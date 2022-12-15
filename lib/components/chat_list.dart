import 'package:chatapp/appcolors/app_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatList extends StatelessWidget {
   ChatList({super.key,required this.massageStream});

Stream massageStream;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
       stream: massageStream,
      builder:(context, snapshot) {
     if (snapshot.hasData){
      QuerySnapshot values=snapshot.data as QuerySnapshot;
      String currentUserEmail= FirebaseAuth.instance.currentUser!.email!;
    
      return ListView.builder(
        shrinkWrap: true,
        itemCount: values.docs.length,
        itemBuilder: (context, index) {
            bool isSender= values.docs[index]['sender'] ==currentUserEmail;
          return Align(
            alignment:isSender?Alignment.centerRight :Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:isSender? AppColors.kRenderColor:AppColors.kReceverColor,
          
              ),
              child: Text('${values.docs[index]['text']}'),
            ),
          );
        },);
     }
     else{
      return Text('Error');
     }
    } ,);
  }
}