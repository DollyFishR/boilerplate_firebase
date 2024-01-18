import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meta/meta.dart';

import '../repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = Modular.get<AuthRepository>();
  AuthBloc() : super(const AuthState.initial()) {
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

    on<FacebookSignInRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await authRepository.signInWithFacebook();
        emit(state.copyWith(status: AuthStatus.authenticated));
      } catch (e) {
        emit(state.copyWith(status: AuthStatus.error, error: e.toString()));
        emit(const AuthState.initial());
      }
    });

    on<AppleSignInRequested>((event, emit) async {
      emit(state.copyWith(status: AuthStatus.loading));
      try {
        await authRepository.signInWithApple();
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
