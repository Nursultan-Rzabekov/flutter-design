import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/bloc/states/beer_state.dart';
import 'package:flutter_learn_bloc/models/beer_model.dart';
import 'package:flutter_learn_bloc/services/repository.dart';
import 'package:http/http.dart' as http;

import 'events/beer_event.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final Repository beerRepository;
  int page = 1;
  bool isFetching = false;

  BeerBloc({
    @required this.beerRepository,
  }) : super(BeerInitialState());

  @override
  Stream<BeerState> mapEventToState(BeerEvent event) async* {
    if (event is BeerFetchEvent) {
      yield BeerLoadingState(message: 'Loading Beers');
      final response = await beerRepository.getBeers(page);
      if (response is http.Response) {
        if (response.statusCode == 200) {
          final beers = jsonDecode(response.body) as List;
          yield BeerSuccessState(
            beers: beers.map((beer) => BeerModel.fromJson(beer)).toList(),
          );
          page++;
        } else {
          yield BeerErrorState(error: response.body);
        }
      } else if (response is String) {
        yield BeerErrorState(error: response);
      }
    }
  }
}
