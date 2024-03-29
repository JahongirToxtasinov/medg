part of 'auth_bloc.dart';

class AuthenticatedState {
  final AuthenticatedStatus authenticatedStatus;
  final AuthenticatedUserEntity authenticatedUser;
  final bool isObscure;
  AuthenticatedState({
    required this.authenticatedStatus,
    required this.authenticatedUser,
    required this.isObscure,
  });

  AuthenticatedState copyWith({
    AuthenticatedStatus? authenticatedStatus,
    AuthenticatedUserEntity? authenticatedUser,
    bool? isObscure,
  }) {
    return AuthenticatedState(
      authenticatedStatus: authenticatedStatus ?? this.authenticatedStatus,
      authenticatedUser: authenticatedUser ?? this.authenticatedUser,
      isObscure: isObscure ?? this.isObscure,
    );
  }

  @override
  String toString() =>
      '''
   AuthenticatedState
   authStatus: $authenticatedStatus, 
   authUser: $authenticatedUser
   isObscure: $isObscure''';
}
