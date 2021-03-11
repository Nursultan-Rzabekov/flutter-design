import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_learn_bloc/pages/beer_screen.dart';
import 'package:flutter_learn_bloc/widgets/state_indicator.dart';
import 'pages/home_bottom_nav.dart';
import 'package:alice/alice.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(HomeApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateAppIndicator();
  }
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) {
              return _makeRoute(
                  context: context,
                  routeName: settings.name,
                  arguments: settings.arguments);
            },
            maintainState: true,
            fullscreenDialog: false,
          );
        });
  }
}

class BeerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beer App',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => DisplayBeerScreen(),
      },
    );
  }
}

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('$error, $stackTrace');
    super.onError(cubit, error, stackTrace);
  }
}

Widget _makeRoute(
    {@required BuildContext context,
    @required String routeName,
    Object arguments}) {
  final Widget child = _buildRoute(
    context: context,
    routeName: routeName,
    arguments: arguments,
  );
  return child;
}

Widget _buildRoute({
  @required BuildContext context,
  @required String routeName,
  Object arguments,
}) {
  switch (routeName) {
    case '/beerScreen':
      return DisplayBeerScreen();
    default:
      return Container();
  }
}
