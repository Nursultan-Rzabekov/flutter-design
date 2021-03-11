import 'package:flutter/foundation.dart';
import 'package:flutter_learn_bloc/models/beer_model.dart';

abstract class BeerState {
  const BeerState();
}

class BeerInitialState extends BeerState {
  const BeerInitialState();
}

class BeerLoadingState extends BeerState {
  final String message;

  const BeerLoadingState({
    @required this.message,
  });
}

class BeerSuccessState extends BeerState {
  final List<BeerModel> beers;

  const BeerSuccessState({
    @required this.beers,
  });
}

class BeerErrorState extends BeerState {
  final String error;

  const BeerErrorState({
    @required this.error,
  });
}
