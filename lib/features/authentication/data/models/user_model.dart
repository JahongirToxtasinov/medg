import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity{


  AuthenticatedUserModel({required super.email});

  factory AuthenticatedUserModel.fromFirebaseUser(User user){
    return AuthenticatedUserModel(email: user.email ?? '');
  }
}