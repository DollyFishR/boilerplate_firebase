part of 'auth_bloc.dart';

enum AuthStatus { loading, authenticated, unauthenticated, error }

@immutable
class AuthState extends Equatable {
  const AuthState(this.status, this.error);
  final AuthStatus status;
  final String? error;

  const AuthState.initial() : this(AuthStatus.unauthenticated, null);

  AuthState copyWith({AuthStatus? status, String? error}) {
    return AuthState(status ?? this.status, error ?? this.error);
  }

  @override
  List<Object?> get props => [status, error];
}
