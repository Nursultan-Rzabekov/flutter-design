import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/cubit/states/user_state.dart';
import 'package:flutter_learn_bloc/models/user.dart';
import 'package:flutter_learn_bloc/services/repository.dart';

class UserCubit extends Cubit<UserState> {
  final Repository usersRepository;

  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> _loadedUserList = await usersRepository.getUsers();
      emit(UserLoadedState(loadedUser: _loadedUserList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
