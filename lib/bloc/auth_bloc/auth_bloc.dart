import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../repository/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(const AuthState.initial()) {
    on<SignInRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await authRepository.signIn(
            email: event.email, password: event.password);
        emit(state.copyWith(status: AuthStatus.authenticated));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
        emit(const AuthState.initial());
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await authRepository.signUp(
            email: event.email, password: event.password);
        emit(state.copyWith(status: AuthStatus.authenticated));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
        emit(const AuthState.initial());
      }
    });

    on<GoogleSignInRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await authRepository.signInWithGoogle();
        emit(state.copyWith(status: AuthStatus.authenticated));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
        emit(const AuthState.initial());
      }
    });

    on<SignOutRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      await authRepository.signOut();
      emit(const AuthState.initial());
    });
  }
}
