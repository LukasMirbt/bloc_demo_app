import 'package:bloc_demo_app/city_list/city_list.dart';
import 'package:city_repository/city_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CityList extends StatelessWidget {
  const CityList({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (CityListBloc bloc) => bloc.state.status.isLoading,
    );

    final cities = context.select(
      (CityListBloc bloc) => bloc.state.cities,
    );

    return Skeletonizer(
      enabled: isLoading,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        itemCount: cities.isEmpty ? 1 : cities.length,
        itemBuilder: (context, index) {
          if (cities.isEmpty) {
            return const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text('No results found.'),
              ),
            );
          }

          final item = cities[index];
          return _Item(item);
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item(this.item);

  final City item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 24,
      title: Text(item.name),
      subtitle: Text(
        switch (item.area) {
          Area.usa => 'USA',
          Area.sweden => 'Sweden',
          Area.australia => 'Australia',
        },
      ),
      leading: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade300,
        ),
        child: Skeleton.ignore(
          child: Icon(
            Icons.location_on_outlined,
            size: 18,
            color: Colors.black.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
