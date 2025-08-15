import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_serviece/core/unified_api/api_variabels.dart';
import 'package:home_serviece/feature/estate/presentation/widget/estate_data.dart';
import 'package:home_serviece/feature/order/bloc/bloc/order_bloc.dart';
import 'package:home_serviece/feature/order/data/data_source/order_datasource.dart';
import 'package:home_serviece/feature/order/presentation/screen/request_house_screen.dart';

class HouseRequestsTab extends StatelessWidget {
  const HouseRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocProvider(
        create: (_) => OrderBloc(
            dataSource: OrderDataSource(apiVariabels: ApiVariabels())),
        child: Builder(
          builder: (context) {
            return CreateHouseOrderContent(
              houseId: 1,
              estate: estates.first,
            );
          },
        ),
      ),
    );
  }
}
