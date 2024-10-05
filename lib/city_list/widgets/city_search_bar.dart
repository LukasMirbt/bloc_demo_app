import 'package:bloc_demo_app/city_list/city_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitySearchBar extends StatelessWidget {
  const CitySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      hintText: 'Search',
      elevation: const WidgetStatePropertyAll(0),
      onChanged: (value) {
        context.read<CityListBloc>().add(
              CityListSearchChanged(value),
            );
      },
    );
  }
}
