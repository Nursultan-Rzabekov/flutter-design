import 'package:flutter_learn_bloc/models/user.dart';
import 'package:flutter_learn_bloc/services/data_provider.dart';

class Repository {
  DataProvider _dataProvider = DataProvider();

  Future<List<User>> getUsers() => _dataProvider.getUsersList();

  Future<dynamic> getBeers(int page) => _dataProvider.getBeers(page: page);
}
