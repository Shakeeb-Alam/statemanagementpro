import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:intl/intl.dart';
import 'package:statemanagement/controllers/covid-controller.dart';
import 'package:statemanagement/domain/covid_model.dart';

import '../api/covid_api.dart';
import '../domain/user-model.dart';

class CovidScreen extends StatefulWidget {
  const CovidScreen({super.key});

  @override
  State<CovidScreen> createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  DateTime selectedDate = DateTime.now();

  String formattedDate = '';
  CovidController covidController = Get.find<CovidController>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(
        () {
          selectedDate = picked;

          DateFormat inputDate = DateFormat('yyyy-MM-dd');
          //DateTime parsedDate = inputDate.parse(picked.toIso8601String());
          String formattedDate = inputDate.format(picked);
          print(formattedDate);
        },
      );
      covidController
          .getCovidData(DateFormat('yyyy-MM-dd').format(selectedDate));
    }
  }

  @override
  void initState() {
    super.initState();

    covidController.getCovidData(DateFormat('yyyy-MM-dd').format(selectedDate));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CovidController>(
      builder: (covidController) {
        return Scaffold(
          floatingActionButton: covidController.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () {
                    _selectDate(context);
                    // CovidApi().getData();
                  },
                  child: const Text('press'),
                ),
          body: Column(
            children: [
              ListTile(
                  title: Text('confirmed '),
                  subtitle: Text(
                      covidController.covidReport.confirmed.toString() ?? '')),
              ListTile(
                  title: Text('confirmed Diff'),
                  subtitle: Text(
                      covidController.covidReport.confirmedDiff.toString() ??
                          '')),
              ListTile(
                  title: Text('Death'),
                  subtitle: Text(
                      covidController.covidReport.deaths.toString() ?? '')),
              ListTile(
                  title: Text('Death Diff'),
                  subtitle: Text(
                      covidController.covidReport.deathsDiff.toString() ?? '')),
              ListTile(
                  title: Text('recovered'),
                  subtitle: Text(
                      covidController.covidReport.recovered.toString() ?? '')),
              ListTile(
                  title: Text('recovered diff'),
                  subtitle: Text(
                      covidController.covidReport.recoveredDiff.toString() ??
                          '')),
              ListTile(
                  title: Text('active'),
                  subtitle: Text(
                      covidController.covidReport.active.toString() ?? '')),
              ListTile(
                  title: Text('active diff'),
                  subtitle: Text(
                      covidController.covidReport.activeDiff.toString() ?? '')),
              ListTile(
                  title: Text('facility rate'),
                  subtitle: Text(
                      covidController.covidReport.fatalityRate.toString() ??
                          '')),
              ListTile(
                  title: Text('Date'),
                  subtitle:
                      Text(covidController.covidReport.date.toString() ?? '')),
              // Column(
              //    children: [
              //      Text(covidController.covidReport.confirmed.toString()??''),
              //      Text(covidController.covidReport.confirmedDiff.toString()??''),
              //      Text(covidController.covidReport.deaths.toString()??''),
              //      Text(covidController.covidReport.deathsDiff.toString()??''),
              //      Text(covidController.covidReport.recovered.toString()??''),
              //      Text(covidController.covidReport.recoveredDiff.toString()??''),
              //      Text(covidController.covidReport.active.toString()??''),
              //      Text(covidController.covidReport.activeDiff.toString()??''),
              //    ]
              //  )
            ],
          ),
          // body: GestureDetector(
          //   onTap: (){
          //
          //     CovidApi().getData();
          //   },
          //
          //   child: Container(
          //
          //     child:
          //
          //     Center(child: Text('Button')),
          //   ),
          // )
        );
      },
    );
  }
}
