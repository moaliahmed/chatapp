part of 'chat_cubit.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatMassageSenderSuccess extends ChatState {}
class ChatMassageSenderLoding extends ChatState {}
class ChatMassageSenderError extends ChatState {}

class ChatReceiveMassage extends ChatState {}
