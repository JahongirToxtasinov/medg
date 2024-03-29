import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/status/auth_status.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/data_sources/auth_remote_data_source.dart';
import '../../data/repositories/repo_impl.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use_cases/auth_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticatedBloc extends Bloc<AuthenticatedEvent, AuthenticatedState> {
  AuthenticatedBloc()
      : super(
    AuthenticatedState(
      authenticatedUser: const AuthenticatedUserEntity(email: ''),
      authenticatedStatus: AuthenticatedStatus.unknown,
      isObscure: true,
    ),
  ) {
    on<AuthenticatedUser>(
          (event, emit) async {
        final useCase = AuthenticateUseCase(
            AuthenticationRepositoryImpl(dataSource: AuthRemoteDataSource()));
        final either = await useCase.call(GetStatusParams());
        either.either(
              (failure) {
            emit(
              state.copyWith(
                authenticatedStatus: AuthenticatedStatus.unAuthenticated,
              ),
            );
          },
              (user) {
            emit(
              state.copyWith(
                authenticatedUser: user,
                authenticatedStatus: AuthenticatedStatus.authenticated,
              ),
            );
          },
        );
      },
    );
    on<CreateUserAuth>(
          (event, emit) async {
        final useCase = AuthenticateUseCase(
            AuthenticationRepositoryImpl(dataSource: AuthRemoteDataSource()));
        final either = await useCase.call(
          SignUp(email: event.emailText, password: event.passwordText),
        );
        either.either((failure) {
          emit(
            state.copyWith(
                authenticatedStatus: AuthenticatedStatus.unAuthenticated),
          );
          event.onFailure((failure as ServerFailure).message);
        }, (user) {
          emit(
            state.copyWith(
              authenticatedStatus: AuthenticatedStatus.authenticated,
              authenticatedUser: user,
            ),
          );
          event.onSuccess();
        });
      },
    );
    on<LogoutUser>(
          (event, emit) async {
        final useCase = LogoutUseCase(
            repository: AuthenticationRepositoryImpl(
                dataSource: AuthRemoteDataSource()));
        final either = await useCase.call(NoParams());
        either.either(
              (failure) {},
              (user) {
            emit(
              state.copyWith(
                  authenticatedStatus: AuthenticatedStatus.unAuthenticated),
            );

          },
        );
      },
    );
    on<IsObscure>((event, emit) {
      emit(state.copyWith(isObscure: !event.isObscure));
    });
    on<LoginUserAuth>(
          (event, emit) async {
        final useCase = AuthenticateUseCase(
          AuthenticationRepositoryImpl(
            dataSource: AuthRemoteDataSource(),
          ),
        );
        final either = await useCase.call(
          LoginParams(
            email: event.emailText,
            password: event.passwordText,
          ),
        );
        either.either(
              (failure) {
            emit(
              state.copyWith(
                authenticatedStatus: AuthenticatedStatus.unAuthenticated,
              ),
            );
            event.onFailure((failure as ServerFailure).message);
          },
              (user) {
            emit(
              state.copyWith(
                authenticatedUser: user,
                authenticatedStatus: AuthenticatedStatus.authenticated,
              ),
            );
            event.onSuccess();
          },
        );
      },
    );
  }
}