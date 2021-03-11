import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/cubit/states/user_state.dart';
import 'package:flutter_learn_bloc/models/user.dart';
import 'package:flutter_learn_bloc/services/repository.dart';

import 'events/user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repository usersRepository;
  UserBloc({this.usersRepository})
      : assert(usersRepository != null),
        super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await usersRepository.getUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
