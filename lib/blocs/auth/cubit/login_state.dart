part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class authRegisterLoding extends LoginState {}
class authRegisterSucess extends LoginState {}
class authRegisterError extends LoginState {}


class authLoginLoding extends LoginState {}
class authLoginSucess extends LoginState {}
class authLoginError extends LoginState {}