import 'package:covid_19_tracker_app/Model/WorldStatesModel.dart';
import 'package:covid_19_tracker_app/Services/Utilities/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:covid_19_tracker_app/View/countries_list_screen.dart';

class WorldStats extends StatefulWidget {
  const WorldStats({Key? key}) : super(key: key);

  @override
  State<WorldStats> createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const PieChart(
                dataMap: {
                  "Total": 100,
                  "Recovered": 90,
                  "Deaths": 10,
                },
                chartType: ChartType.ring,
                animationDuration: Duration(milliseconds: 1500),
                chartRadius: 130,
                chartValuesOptions: ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
                colorList: [
                  Colors.green,
                  Colors.blue,
                  Colors.red,
                ],
              ),
              SizedBox(
                height: 90,
              ),
              Card(
                color: Colors.black12,
                child: Column(
                  children: [
                    reuseableRow(title: 'Total:', value: '100'),
                    reuseableRow(title: 'Tests:', value: '90'),
                    reuseableRow(title: 'Recovered:', value: '90'),
                    reuseableRow(title: 'Critical:', value: '90'),
                    reuseableRow(title: 'Deaths:', value: '10'),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Divider(
                color: Colors.black87,
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const CountriesListScreen())),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Text(
                      'Track Countries',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class reuseableRow extends StatelessWidget {
  String title, value;

  reuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
