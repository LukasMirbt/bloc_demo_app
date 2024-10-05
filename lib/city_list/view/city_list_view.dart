import 'package:bloc_demo_app/city_list/city_list.dart';
import 'package:flutter/material.dart';

class CityListView extends StatelessWidget {
  const CityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('City List'),
      ),
      body: const Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: CitySearchBar(),
          ),
          SizedBox(height: 16),
          Divider(height: 1),
          Expanded(
            child: CityList(),
          ),
        ],
      ),
    );
  }
}
