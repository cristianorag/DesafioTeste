import 'package:desafioteste/widgets/constante.dart';
import 'package:flutter/material.dart';
import 'package:desafioteste/model/dados_covid.dart';
import 'package:desafioteste/repositorio/repositorio_covid.dart';
import 'package:intl/intl.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ListPage> {
  late Future<List<CovidModel>>? _fetch;
  late List<CovidModel> _data;
  int? _sortColumnIndex;
  bool _isAscending = false;

  @override
  void initState() {
    _fetch = CovidRepository.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Status do Covid'),
        backgroundColor: logincolor,
      ),
      body: FutureBuilder<List<CovidModel>>(
        future: _fetch,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _data = snapshot.data!;

            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Center(
                    child: DataTable(
                        sortColumnIndex: _sortColumnIndex,
                        sortAscending: _isAscending,
                        columns: [
                          DataColumn(
                              label: const Text('Data',
                                  textAlign: TextAlign.center),
                              onSort: onSort),
                          DataColumn(
                              label:
                                  const Text('UF', textAlign: TextAlign.center),
                              onSort: onSort),
                          DataColumn(
                              label: const Text('Confirmações',
                                  textAlign: TextAlign.center),
                              onSort: onSort),
                          DataColumn(
                              label: const Text('Confirmados/100k hab.',
                                  textAlign: TextAlign.center),
                              onSort: onSort),
                          DataColumn(
                              label: const Text('Mortes',
                                  textAlign: TextAlign.center),
                              onSort: onSort),
                          DataColumn(
                              label: const Text('Mortes/confirmados',
                                  textAlign: TextAlign.center),
                              onSort: onSort),
                          DataColumn(
                              label: const Text('População estimada',
                                  textAlign: TextAlign.center),
                              onSort: onSort),
                        ],
                        rows: _data
                            .map((CovidModel covidModel) => DataRow(
                                  cells: [
                                    DataCell(Text(
                                        DateFormat("dd/MM/yyyy").format(
                                            DateTime.parse(covidModel.date!)),
                                        textAlign: TextAlign.center)),
                                    DataCell(Text(covidModel.state!,
                                        textAlign: TextAlign.center)),
                                    DataCell(Text(covidModel.confirmed!,
                                        textAlign: TextAlign.center)),
                                    DataCell(Text(
                                        covidModel.confirmedPer100kInhabitants!,
                                        textAlign: TextAlign.center)),
                                    DataCell(Text(covidModel.deaths!,
                                        textAlign: TextAlign.center)),
                                    DataCell(Text(covidModel.deathRate!,
                                        textAlign: TextAlign.center)),
                                    DataCell(Text(
                                        covidModel.estimatedPopulation!,
                                        textAlign: TextAlign.center)),
                                  ],
                                ))
                            .toList()),
                  ),
                ));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(
                child: CircularProgressIndicator(color: logincolor));
          }
        },
      ),
    );
  }

  void Function(int, bool)? onSort(int columnIndex, bool ascending) {
    switch (columnIndex) {
      case 0:
        _data.sort((data1, data2) =>
            compareString(ascending, data1.date!, data2.date!));
        break;
      case 1:
        _data.sort((data1, data2) =>
            compareString(ascending, data1.state!, data2.state!));
        break;
      case 2:
        _data.sort((data1, data2) =>
            compareString(ascending, data1.confirmed!, data2.confirmed!));
        break;
      case 3:
        _data.sort((data1, data2) => compareString(
            ascending,
            data1.confirmedPer100kInhabitants!,
            data2.confirmedPer100kInhabitants!));
        break;
      case 4:
        _data.sort((data1, data2) =>
            compareString(ascending, data1.deaths!, data2.deaths!));
        break;
      case 5:
        _data.sort((data1, data2) =>
            compareString(ascending, data1.deathRate!, data2.deathRate!));
        break;
      case 6:
        _data.sort((data1, data2) => compareString(
            ascending, data1.estimatedPopulation!, data2.estimatedPopulation!));
        break;
    }

    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
