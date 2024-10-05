import 'package:bloc_demo_app/city_list/city_list.dart';
import 'package:city_repository/city_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityListPage extends StatelessWidget {
  const CityListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CityListBloc(
        cityRepository: context.read<CityRepository>(),
      )..add(
          const CityListStarted(),
        ),
      child: const CityListView(),
    );
  }
}
