import 'package:covid_app/services/routes/routes_name.dart';
import 'package:covid_app/view/countries_list.dart';
import 'package:covid_app/view/details_screen.dart';
import 'package:covid_app/view/splash_screen.dart';
import 'package:covid_app/view/world_state.dart';
import 'package:flutter/material.dart';

class RoutesServices {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutesName.worldStateScreen:
        return MaterialPageRoute(builder: (_) => WorldStateScreen());
      case RoutesName.countriesListScreen:
        return MaterialPageRoute(builder: (_) => CountriesListScreen());
      case RoutesName.detailsScreen:
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            data: settings.arguments as Map,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: SafeArea(
              child: Center(
                child: Text("No routes defined for ${settings.name}"),
              ),
            ),
          ),
        );
    }
  }
}
