import 'package:covid_19_tracker_app/Services/Utilities/states_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    countriesServices countriesservices = countriesServices();
    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 13, top: 20, right: 13),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search Any Country',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.white38,
              ),
              FutureBuilder(
                future: countriesservices.getcountriesList(),
                builder: ((context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            leading: Image(image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                            title: Text(snapshot.data![index]['country']),
                            subtitle: Text(snapshot.data![index]['cases']),
                          );
                        }));
                  }
                }),
              )
            ]),
      ),
    );
  }
}
