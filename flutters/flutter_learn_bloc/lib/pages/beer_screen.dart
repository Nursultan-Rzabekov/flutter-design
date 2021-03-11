import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/bloc/beer_bloc.dart';
import 'package:flutter_learn_bloc/bloc/events/beer_event.dart';
import 'package:flutter_learn_bloc/services/repository.dart';
import 'package:flutter_learn_bloc/widgets/beer_body.dart';

class DisplayBeerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeerBloc(
        beerRepository: Repository(),
      )..add(BeerFetchEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Beers \u{1F37A}'),
        ),
        body: BeerBody(),
      ),
    );
  }
}
