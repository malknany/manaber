abstract class LoginStates {}

class LoginInitialStates extends LoginStates {}

class LoginLoadingtState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  //
  // late final UserModel loginModel;
  // LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  final String? message;

  LoginErrorState({required this.message});

}