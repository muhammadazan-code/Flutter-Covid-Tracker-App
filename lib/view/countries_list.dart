import 'package:covid_app/services/routes/routes_name.dart';
import 'package:covid_app/services/States/states_services.dart';
import 'package:covid_app/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  FocusNode? focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                focusNode: focusNode,
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  hintText: "Search with country name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                        itemCount: MediaQuery.of(context).size.width.toInt(),
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          /* If the data is not comming from the server cause any internet issue then Shimmer efferct will be display. */
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    height: 20,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        String countryNames = snapshot.data![index]['country'];
                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                  FocusScope.of(context).unfocus();
                                  Navigator.pushNamed(
                                      context, RoutesName.detailsScreen,
                                      arguments: {
                                        "active": snapshot.data![index]
                                            ['active'],
                                        "critical": snapshot.data![index]
                                            ['critical'],
                                        "image": snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        "name": snapshot.data![index]
                                            ['country'],
                                        "test": snapshot.data![index]['test'],
                                        "todayRecovered": snapshot.data![index]
                                            ['todayRecovered'],
                                        "totalCases": snapshot.data![index]
                                            ['cases'],
                                        "totalDeaths": snapshot.data![index]
                                            ['deaths'],
                                        "totalRecovered": snapshot.data![index]
                                            ['recovered'],
                                      });
                                },
                                child: ListTile(
                                  title: Text(countryNames.toString()),
                                  leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (countryNames
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {});
                                  FocusScope.of(context).unfocus();
                                  Navigator.pushNamed(
                                      context, RoutesName.detailsScreen,
                                      arguments: {
                                        "active": snapshot.data![index]
                                            ['active'],
                                        "critical": snapshot.data![index]
                                            ['critical'],
                                        "image": snapshot.data![index]
                                            ['countryInfo']['flag'],
                                        "name": snapshot.data![index]
                                            ['country'],
                                        "test": snapshot.data![index]['test'],
                                        "todayRecovered": snapshot.data![index]
                                            ['todayRecovered'],
                                        "totalCases": snapshot.data![index]
                                            ['cases'],
                                        "totalDeaths": snapshot.data![index]
                                            ['deaths'],
                                        "totalRecovered": snapshot.data![index]
                                            ['recovered'],
                                      });
                                },
                                child: ListTile(
                                  title: Text(countryNames.toString()),
                                  // Country
                                  leading: Image(
                                    height: 60,
                                    width: 50,
                                    image: NetworkImage(
                                      snapshot.data![index]['countryInfo']
                                          ['flag'],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
                future: statesServices.countriesListApi(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
