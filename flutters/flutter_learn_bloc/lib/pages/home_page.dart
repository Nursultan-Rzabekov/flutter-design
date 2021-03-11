import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/bloc/user_bloc.dart';
import 'package:flutter_learn_bloc/cubit/user_cubit.dart';
import 'package:flutter_learn_bloc/services/repository.dart';
import 'package:flutter_learn_bloc/widgets/action_buttons.dart';
import 'package:flutter_learn_bloc/widgets/users_list.dart';

class HomePage extends StatelessWidget {
  final repository = Repository();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(create: (context) => UserCubit(repository)),
        BlocProvider<UserBloc>(
            create: (context) => UserBloc(usersRepository: repository))
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Appbars"),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            ActionButtons(),
            Expanded(child: UsersList())
          ],
        ),
      ),
    );
  }
}
