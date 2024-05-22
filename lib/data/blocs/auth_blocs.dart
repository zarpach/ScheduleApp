import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../bloc/auth_repository.dart';
import '../local_storage_service.dart';

part 'auth_events.dart';
part 'auth_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final LocalStorageService _localStorageService;

  AuthBloc(this._authRepository, this._localStorageService) : super(AuthInitial()) {
    on<SignInWithGoogle>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authRepository.signInWithGoogle();
        if (user != null) {
          await _localStorageService.setIsLoggedIn(true);
          emit(AuthAuthenticated(user: user));
        } else {
          emit(const AuthError(message: "Sign in aborted by user"));
        }
      } catch (e) {
        emit(AuthError(message: e.toString()));
      }
    });

    on<SignOut>((event, emit) async {
      await _authRepository.signOut();
      await _localStorageService.setIsLoggedIn(false);
      emit(AuthInitial());
    });

    on<CheckLoginStatus>((event, emit) async {
      bool isLoggedIn = await _localStorageService.getIsLoggedIn();
      if (isLoggedIn && _authRepository.currentUser != null) {
        print('Authed!');
        emit(AuthAuthenticated(user: _authRepository.currentUser!));

      } else {
        print('Not authed!');
        emit(AuthInitial());
      }
    });
  }
}
