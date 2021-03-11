import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/bloc/events/beer_event.dart';
import 'package:flutter_learn_bloc/bloc/events/user_event.dart';
import 'package:flutter_learn_bloc/bloc/user_bloc.dart';
import 'package:flutter_learn_bloc/cubit/user_cubit.dart';

class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: Icon(Icons.download_outlined),
            onPressed: () {
              context.bloc<UserCubit>().fetchUsers();
            }),
        IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              context.bloc<UserCubit>().clearUsers();
            }),
        IconButton(
            icon: Icon(Icons.download_done_sharp),
            onPressed: () {
              context.bloc<UserBloc>().add(UserLoadEvent());
            }),
        IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              context.bloc<UserBloc>().add(UserClearEvent());
            })
      ],
    );
  }
}
