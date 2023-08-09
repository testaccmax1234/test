import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  StreamSubscription<User>? _userSubscription;

  AuthBloc({required AuthService authService})
      : _authService = authService,
        super(AuthState.initial()) {
    on<AuthSignUpEvent>(_onSignUp);
    on<AuthSignInEvent>(_onSignIn);
    on<AuthSignOutEvent>(_onSignOut);

    _userSubscription = _authService.userStream().listen(_userChanged);
  }

  void _userChanged(User user) => add(AuthSignInEvent(user));

  Future<void> _onSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _authService.signUp(event.email, event.password);
      emit(state.copyWith(status: AuthStatus.success));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: err.toString()));
    }
  }

  Future<void> _onSignIn(AuthSignInEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _authService.signIn(event.email, event.password);
      emit(state.copyWith(status: AuthStatus.success));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: err.toString()));
    }
  }

  Future<void> _onSignOut(AuthSignOutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await _authService.signOut();
      emit(state.copyWith(status: AuthStatus.success));
    } catch (err) {
      emit(state.copyWith(status: AuthStatus.error, errorMessage: err.toString()));
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}